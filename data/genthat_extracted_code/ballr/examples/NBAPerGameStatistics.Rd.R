library(ballr)


### Name: NBAPerGameStatistics
### Title: NBA Player Statistics For a Given Season Per Game
### Aliases: NBAPerGameStatistics

### ** Examples

library(magrittr)

players <- NBAPerGameStatistics(season = 2018)
players

players %>%
  dplyr::filter(mp > 20, pos %in% c("SF")) %>%
  dplyr::select(player, link) %>%
  dplyr::distinct()




