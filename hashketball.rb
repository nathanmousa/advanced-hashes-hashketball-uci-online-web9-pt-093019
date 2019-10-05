def game_hash
game_hash = {
  home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: [
      { player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
      },
      { player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
      },
      
      { player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
      },
      
      { player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
      },
      
      { player_name: "Jason Terry",
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1
      }
    ]
  },
  
  away: {
    team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: [
      { player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      
      { player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10
      },
      
      { player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
      },
      
      { player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
      },
      
      { player_name: "Kemba Walker",
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12
      }
      ]
  }
}
game_hash
end

def num_points_scored(name)
  #search main hash and drill down to players
  game_hash.each do |location, team_data|
    #binding.pry
    team_data[:players].each do |player|
      #binding.pry
      if player[:player_name] == name
        return player[:points]
      end
    end
  end
end

def shoe_size(name)
  #search main hash and drill down to players
  game_hash.each do |location, team_data|
    #binding.pry
    team_data[:players].each do |player|
      #binding.pry
      if player[:player_name] == name
        return player[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
end

def team_names
  teams = []
  game_hash.each do |location, team_data|
    teams << team_data[:team_name]
  end
  teams
end

def player_numbers(team_name)
  jerseys = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data[:players].each do |stats|
        jerseys << stats[:number]
      end
    end
  end
  jerseys
end

def player_stats(name)
  stats = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |stat|
      if stat[:player_name] == name
        stats[:number] = stat[:number] 
        stats[:shoe] = stat[:shoe]
        stats[:points] = stat[:points]
        stats[:rebounds] = stat[:rebounds]
        stats[:assists] = stat[:assists]
        stats[:steals] = stat[:steals]
        stats[:blocks] = stat[:blocks]
        stats[:slam_dunks] = stat[:slam_dunks]
      end
    end
  end
  stats
end

def big_shoe_rebounds
  shoe_size = 0
  rebound = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |stat|
      if stat[:shoe] > shoe_size
        shoe_size = stat[:shoe]
        rebound = stat[:rebounds]
      end
    end
  end
  rebound
end

def most_points_scored
  most_points = 0
  vip = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |stat|
      # if stat[:points] is the biggest, return stat[:player_name]
      if stat[:points] > most_points
        most_points = stat[:points]
        vip = stat[:player_name]
      end
    end
  end
  vip
end

def winning_team
  home = 0
  away = 0
  # reduce away points and home points, compare, return greatest
  game_hash.each do |location, team_data|
    if :home
      team_data[:players].each do |stat|
        home += stat[:points]
      end
    elsif :away
      team_data[:players].each do |stat|
        away += stat[:points]
      end
    end
    
    if home > away
      return game_hash[:home][:team_name]
    elsif home < away
      return game_hash[:away][:team_name]
    else
      return "It's a tie!"
    end
  end
end

def player_with_longest_name
  name_length = 0
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |stat|
      if stat[:player_name].length > name_length
        name_length = stat[:player_name].length
        longest_name = stat[:player_name]
      end
    end
  end
  longest_name
end

def long_name_steals_a_ton?
  # player_with_longest_name have the most steals (variation of most_points_scored)?
  most_steals = 0
  thief = ""
    game_hash.each do |location, team_data|
      team_data[:players].each do |stat|
        if stat[:steals] > most_steals
          most_steals = stat[:steals]
          thief = stat[:player_name]
        end
      end
    end 
  thief == player_with_longest_name
end