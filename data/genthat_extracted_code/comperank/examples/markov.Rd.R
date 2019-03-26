library(comperank)


### Name: markov
### Title: Markov method
### Aliases: markov rate_markov rank_markov

### ** Examples

rate_markov(
  cr_data = ncaa2005,
  # player2 "votes" for player1 if player1 won
  comperes::num_wins(score1, score2, half_for_draw = FALSE),
  stoch_modify = vote_equal
)

rank_markov(
  cr_data = ncaa2005,
  comperes::num_wins(score1, score2, half_for_draw = FALSE),
  stoch_modify = vote_equal
)

rank_markov(
  cr_data = ncaa2005,
  comperes::num_wins(score1, score2, half_for_draw = FALSE),
  stoch_modify = vote_equal,
  keep_rating = TRUE
)

# Combine multiple stochastic matrices and
# use inappropriate `fill` which misrepresents reality
rate_markov(
  cr_data = ncaa2005[-(1:2), ],
  win = comperes::num_wins(score1, score2, half_for_draw = FALSE),
  # player2 "votes" for player1 proportionally to the amount player1 scored
  # more in direct confrontations
  score_diff = max(mean(score1 - score2), 0),
  fill = list(win = 0.5, score_diff = 10),
  stoch_modify = list(vote_equal, teleport(0.15)),
  weights = c(0.8, 0.2)
)




