library(ballr)


### Name: NBAPerGameStatisticsPer36Min
### Title: NBA Player Statistics For a Given Season per 36 Minutes
### Aliases: NBAPerGameStatisticsPer36Min

### ** Examples

library(magrittr)

players <- NBAPerGameStatisticsPer36Min(season = 2018)
players

players %>%
  dplyr::filter(mp > 20, pos %in% c("SF")) %>%
  dplyr::select(player, link) %>%
  dplyr::distinct()




