library(comperes)


### Name: h2h_mat
### Title: Compute matrix format of Head-to-Head values
### Aliases: h2h_mat to_h2h_mat

### ** Examples

# Only first function is used
ncaa2005 %>%
  h2h_mat(
    mean_score = mean(score1),
    mean_abs_score = mean(abs(score1 - score2))
  )

ncaa2005[-(1:2), ] %>%
  h2h_mat(mean_score = mean(score1), fill = 0)




