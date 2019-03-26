library(comperes)


### Name: h2h_long
### Title: Compute long format of Head-to-Head values
### Aliases: h2h_long to_h2h_long as_tibble.h2h_long

### ** Examples

ncaa2005 %>%
  h2h_long(
    mean_score = mean(score1),
    mean_abs_score = mean(abs(score1 - score2))
  )

ncaa2005[-(1:2), ] %>%
  h2h_long(
    mean_score = mean(score1),
    fill = list(mean_score = 0)
  )




