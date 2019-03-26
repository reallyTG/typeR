library(comperes)


### Name: item-summary
### Title: Compute item summary
### Aliases: item-summary summarise_item summarise_game summarise_player
###   summarize_item summarize_game summarize_player

### ** Examples

ncaa2005 %>%
  dplyr::mutate(game_type = game %% 2) %>%
  summarise_item(c("game_type", "player"), mean_score = mean(score))

ncaa2005 %>%
  summarise_game(mean_score = mean(score), min_score = min(score))




