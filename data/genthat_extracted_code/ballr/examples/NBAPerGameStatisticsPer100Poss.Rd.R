library(ballr)


### Name: NBAPerGameStatisticsPer100Poss
### Title: NBA Player Statistics For a Given Season per 100 Possessions
### Aliases: NBAPerGameStatisticsPer100Poss

### ** Examples

library(magrittr)

players <- NBAPerGameStatisticsPer100Poss(season = 2018)
players

players %>%
  dplyr::filter(pos %in% c("SF")) %>%
  dplyr::select(player, link) %>%
  dplyr::distinct()




