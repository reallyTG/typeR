## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
NOT_TRAVIS <- !identical(tolower(Sys.getenv("TRAVIS")), "true")
NOT_ALL <- NOT_CRAN & NOT_TRAVIS
knitr::opts_chunk$set(purl = NOT_ALL)

## ---- eval = NOT_ALL-----------------------------------------------------
#load installed package 
library(RDota2)

## ---- eval = FALSE-------------------------------------------------------
#  #register key on R. xxxxxx is the key you received from Steam.
#  key_actions(action = 'register_key', value = 'xxxxxxxx')

## ---- eval = NOT_ALL-----------------------------------------------------
#register key on R. Sys.getenv('RDota_KEY') will retrieve the value of the  
#RDota_KEY environment variable which is saved in your .Renviron file.
key_actions(action = 'register_key', value = Sys.getenv('RDota_KEY'))

#now you can use any of the get_* family functions without specifying a key e.g.
heroes <- get_heroes()
head(heroes$content)

## ---- eval = FALSE-------------------------------------------------------
#  #retrieve key
#  key_actions('get_key')
#  #delete key
#  key_actions('delete_key')

## ---- eval = NOT_ALL-----------------------------------------------------
str(get_league_listing()$content)

## ---- eval = FALSE-------------------------------------------------------
#  #information returned about the first game
#  str(get_live_league_games()$content$games[[1]])

## ---- eval = FALSE-------------------------------------------------------
#  #### List of 17
#  ##  $ players            :List of 11
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 292934088
#  ##   .. ..$ name      : chr "FACEIT.com | Shannon Bot"
#  ##   .. ..$ hero_id   : int 0
#  ##   .. ..$ team      : int 4
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 124344565
#  ##   .. ..$ name      : chr "Ryadovoi Lebys"
#  ##   .. ..$ hero_id   : int 91
#  ##   .. ..$ team      : int 1
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 374473137
#  ##   .. ..$ name      : chr "<U+041D><U+0410><U+0421><U+0415><U+041A><U+041E><U+041C><U+042B><U+0428>""| __truncated__
#  ##   .. ..$ hero_id   : int 90
#  ##   .. ..$ team      : int 1
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 53178236
#  ##   .. ..$ name      : chr "Sedoy"
#  ##   .. ..$ hero_id   : int 18
#  ##   .. ..$ team      : int 0
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 84692724
#  ##   .. ..$ name      : chr "PANDA"
#  ##   .. ..$ hero_id   : int 110
#  ##   .. ..$ team      : int 1
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 86840554
#  ##   .. ..$ name      : chr "tmw"
#  ##   .. ..$ hero_id   : int 15
#  ##   .. ..$ team      : int 0
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 123787524
#  ##   .. ..$ name      : chr "Shachlo"
#  ##   .. ..$ hero_id   : int 60
#  ##   .. ..$ team      : int 0
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 159020918
#  ##   .. ..$ name      : chr "RodjER"
#  ##   .. ..$ hero_id   : int 37
#  ##   .. ..$ team      : int 0
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 148096933
#  ##   .. ..$ name      : chr "number0"
#  ##   .. ..$ hero_id   : int 47
#  ##   .. ..$ team      : int 1
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 11550182
#  ##   .. ..$ name      : chr "VANSKOR"
#  ##   .. ..$ hero_id   : int 69
#  ##   .. ..$ team      : int 0
#  ##   ..$ :List of 4
#  ##   .. ..$ account_id: int 86817707
#  ##   .. ..$ name      : chr "72293768"
#  ##   .. ..$ hero_id   : int 82
#  ##   .. ..$ team      : int 1
#  ##  $ radiant_team       :List of 4
#  ##   ..$ team_name: chr "FlipSid3 Tactics"
#  ##   ..$ team_id  : int 2790766
#  ##   ..$ team_logo: num 2.78e+17
#  ##   ..$ complete : logi TRUE
#  ##  $ lobby_id           : num 2.48e+16
#  ##  $ match_id           : num 2.73e+09
#  ##  $ spectators         : int 1256
#  ##  $ series_id          : int 0
#  ##  $ game_number        : int 0
#  ##  $ league_id          : int 5027
#  ##  $ stream_delay_s     : int 300
#  ##  $ radiant_series_wins: int 0
#  ##  $ dire_series_wins   : int 0
#  ##  $ series_type        : int 0
#  ##  $ league_series_id   : int 0
#  ##  $ league_game_id     : int 0
#  ##  $ stage_name         : chr ""
#  ##  $ league_tier        : int 3
#  ##  $ scoreboard         :List of 4
#  ##   ..$ duration            : num 1035
#  ##   ..$ roshan_respawn_timer: int 377
#  ##   ..$ radiant             :List of 11
#  ##   .. ..$ score         : int 13
#  ##   .. ..$ tower_state   : int 1983
#  ##   .. ..$ barracks_state: int 63
#  ##   .. ..$ picks         :List of 5
#  ## truncated...

## ---- eval = NOT_ALL-----------------------------------------------------
#match list contains information about both players and the match
match_details <- get_match_details(match_id = 2686721815)$content

#match_details[[1]] is a list with all the players - usually 10
#match_details[[1]][[1]] is just one of the 10 players
str(match_details[[1]][[1]])

#information about the match
str(match_details[-1])

## ---- eval = NOT_ALL-----------------------------------------------------
#match list contains information about both players and the match
match_details <- get_match_history(matches_requested = 2, 
                                   date_min = '2015-01-01 16:00:00', 
                                   hero_id = 1)$content

#information about the first match
str(match_details[[1]][[1]])

## ---- eval = NOT_ALL-----------------------------------------------------
#get 1 match (out of 2) - match_seq_nums are 250 and 251 
str(get_match_history_by_sequence_num(matches_requested = 2, 
                                      start_at_match_seq_num = 250)$content$matches[[1]])

## ---- eval = NOT_ALL-----------------------------------------------------
#no scheduled games at the time of writing
str(get_scheduled_league_games()$content)

## ---- eval = NOT_ALL-----------------------------------------------------
#information about one team
str(get_team_info_by_team_id()$content$teams[[1]])

## ---- eval = NOT_ALL-----------------------------------------------------
#request seems to be successful but I couldn't find an account id that returned player stats
str(get_tournament_player_stats(account_id = 89550641, league_id = 65006)$content)

## ---- eval = NOT_ALL-----------------------------------------------------
#information about one team
str(get_top_live_game(partner = 1)$content$game_list[[1]])

## ---- eval = NOT_ALL-----------------------------------------------------
str(get_game_items()$content)

## ---- eval = NOT_ALL-----------------------------------------------------
str(get_heroes()$content)

## ---- eval = NOT_ALL-----------------------------------------------------
get_rarities()$content

## ---- eval = NOT_ALL-----------------------------------------------------
str(get_tournament_prize_pool()$content)

## ---- eval = NOT_ALL-----------------------------------------------------
get_event_stats_for_account(eventid = 65006, accountid = 89550641)$content

