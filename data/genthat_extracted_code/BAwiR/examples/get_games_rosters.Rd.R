library(BAwiR)


### Name: get_games_rosters
### Title: Get all games and rosters
### Aliases: get_games_rosters

### ** Examples

## Not run: 
##D library(readr)
##D # 1. The first time, all the historical data until the last games played can be 
##D # directly scraped. 
##D 
##D # ACB seasons available and corresponding games numbers:
##D acb_nums <- list(30001:30257, 31001:31262, 32001:32264, 33001:33492, 34001:34487,
##D                  35001:35494, 36001:36498, 37001:37401, 38001:38347, 39001:39417,
##D                  40001:40415, 41001:41351, 42001:42350, 43001:43339, 44001:44341,
##D                  45001:45339, 46001:46339, 47001:47339, 48001:48341, 49001:49341,
##D                  50001:50339, 51001:51340, 52001:52327, 53001:53294, 54001:54331,
##D                  55001:55331, 56001:56333, 57001:57333, 58001:58332, 59001:59331,
##D                  60001:60332, 61001:61298, 
##D                  62001:62135)
##D names(acb_nums) <- paste(as.character(1985:2017), as.character(1986:2018), sep = "-")
##D 
##D df0 <- data.frame()
##D df_bio0 <- data.frame(CombinID = NA, Player = NA, Position = NA, 
##D                       Height = NA, Date_birth = NA, 
##D                       Nationality = NA, Licence = NA, Website_player = NA)
##D                       
##D # All the games and players:
##D get_data <- get_games_rosters(competition = "ACB", type_league = "ACB", 
##D                               nums = acb_nums, verbose = TRUE, accents = FALSE, 
##D                               r_user = "guillermo.vinue@uv.es", 
##D                               df0 = df0, df_bio0 = df_bio0)
##D acb_games <- get_data$df0
##D acb_players <- get_data$df_bio0
##D write_csv(acb_games, path = "acb_games.csv")
##D write_csv(acb_players, path = "acb_players.csv")        
##D 
##D # 2. Then, in order to scrape new games as they are played, the df0 and df_bio0 objects are
##D # the historical games and rosters:
##D acb_nums <- list(62136:62153)
##D names(acb_nums) <- "2017-2018"
##D df0 <- read_csv("acb_games.csv", guess_max = 1e5)
##D df_bio0 <- read_csv("acb_players.csv", guess_max = 1e3)
##D get_data <- get_games_rosters(competition = "ACB", type_league = "ACB", 
##D                               nums = acb_nums, verbose = TRUE, accents = FALSE, 
##D                               r_user = "guillermo.vinue@uv.es", 
##D                               df0 = df0, df_bio0 = df_bio0)
##D 
##D # -----                               
##D 
##D # ACB Copa del Rey seasons available and corresponding games numbers (rosters were 
##D already downloaded with the ACB league):
##D acb_crey_nums <- list(50001:50004, 51001:51007, 52001:52007, 53033:53039, 
##D                       54033:54039, 55033:55040, 56033:56040, 57029:57036, 
##D                       58025:58032, 59038:59045, 60001:60008, 61001:61007, 
##D                       62001:62007, 63001:63007, 64001:64007, 65001:65007, 
##D                       66001:66007, 67001:67007, 68001:68007, 69001:69007, 
##D                       70001:70007, 71001:71007, 72001:72007, 73001:73007, 
##D                       74001:74007, 75001:75007, 76001:76007, 77001:77007, 
##D                       78001:78007, 79001:79007, 80001:80007, 81001:81007)
##D names(acb_crey_nums) <- paste(as.character(1985:2016), as.character(1986:2017), sep = "-")
##D 
##D df0 <- data.frame()
##D get_data <- get_games_rosters(competition = "ACB", type_league = "CREY", 
##D                               nums = acb_crey_nums, verbose = TRUE, accents = FALSE, 
##D                               r_user = "guillermo.vinue@uv.es", 
##D                               df0 = df0, df_bio0 = NULL)
##D acb_crey_games <- get_data$df0
##D write_csv(acb_crey_games, path = "acb_crey_games.csv")
##D 
##D # -----  
##D 
##D # ACB Supercopa seasons available and corresponding games numbers (rosters were 
##D already downloaded with the ACB league):
##D acb_scopa_nums <- list(1001, 2001, 3001, 4001, 5001:5004, 6001:6004, 
##D                        7001:7003, 9001:9003, 10001:10003, 11001:11003,
##D                        12001:12003, 13001:13003, 14001:14003, 15001:15003, 
##D                        16001:16003, 17001:17003, 18001:18003, 19001:19003)
##D # I haven't found the data for the supercopa in Bilbao 2007 ; 8001:8003
##D # http://www.acb.com/fichas/SCOPA8001.php
##D names(acb_scopa_nums) <- c(paste(as.character(1984:1987), as.character(1985:1988), sep = "-"),
##D                            paste(as.character(2004:2006), as.character(2005:2007), sep = "-"),
##D                            paste(as.character(2008:2018), as.character(2009:2019), sep = "-"))
##D                            
##D df0 <- data.frame()
##D get_data <- get_games_rosters(competition = "ACB", type_league = "SCOPA", 
##D                               nums = acb_scopa_nums, verbose = TRUE, accents = FALSE, 
##D                               r_user = "guillermo.vinue@uv.es", 
##D                               df0 = df0, df_bio0 = NULL)
##D acb_scopa_games <- get_data$df0
##D write_csv(acb_scopa_games, path = "acb_scopa_games.csv")
##D 
##D # -----  
##D 
##D # Euroleague seasons available and corresponding games numbers:
##D euroleague_nums <- list(1:128,
##D                         1:263, 1:250, 1:251, 1:253, 1:253, 1:188, 1:189, 
##D                         1:188, 1:188, 1:231, 1:231, 1:231, 1:229, 1:220, 
##D                         1:220, 1:275, 1:169)
##D names(euroleague_nums) <- 2017:2000
##D 
##D df0 <- data.frame()
##D df_bio0 <- data.frame(CombinID = NA, Player = NA, Position = NA, 
##D                      Height = NA, Date_birth = NA, 
##D                      Nationality = NA, Website_player = NA)
##D get_data <- get_games_rosters(competition = "Euroleague", nums = euroleague_nums, 
##D                               verbose = TRUE, r_user = "guillermo.vinue@uv.es", 
##D                               df0 = df0, df_bio0 = df_bio0)
##D euroleague_games <- get_data$df0
##D euroleague_players <- get_data$df_bio0
##D write_csv(euroleague_games, path = "euroleague_games.csv")
##D write_csv(euroleague_players, path = "euroleague_players.csv")                         
##D 
##D # ----- 
##D 
##D # Eurocup seasons available and corresponding games numbers:
##D eurocup_nums <- list(1:128,
##D                      2:186, 1:306, 1:306, 1:366, 1:157, 1:156, 1:156, 1:156, 
##D                      1:151, 1:326, 1:149, 1:149, 1:239, 1:209, 1:150)
##D names(eurocup_nums) <- 2017:2002
##D 
##D df0 <- data.frame()
##D df_bio0 <- data.frame(CombinID = NA, Player = NA, Position = NA, 
##D                      Height = NA, Date_birth = NA, 
##D                      Nationality = NA, Website_player = NA)
##D get_data <- get_games_rosters(competition = "Eurocup", nums = eurocup_nums, 
##D                               verbose = TRUE, r_user = "guillermo.vinue@uv.es", 
##D                               df0 = df0, df_bio0 = df_bio0)
##D eurocup_games <- get_data$df0
##D eurocup_players <- get_data$df_bio0
##D write_csv(eurocup_games, path = "eurocup_games.csv")
##D write_csv(eurocup_players, path = "eurocup_players.csv") 
##D 
## End(Not run)




