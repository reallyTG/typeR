library(ballr)


### Name: NBAPerGameAdvStatistics
### Title: NBA Player Advanced Statistics For a Given Season
### Aliases: NBAPerGameAdvStatistics

### ** Examples

library(magrittr)

players <- NBAPerGameAdvStatistics(season = 2018)
players

players %>%
  dplyr::filter(pos %in% c("SF")) %>%
  dplyr::select(player, link) %>%
  dplyr::distinct()




