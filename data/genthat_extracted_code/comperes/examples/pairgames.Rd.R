library(comperes)


### Name: pairgames
### Title: Competition results with games between two players
### Aliases: pairgames to_pairgames is_pairgames

### ** Examples

cr_data <- data.frame(
  game = c(rep(1:5, each = 3), 6),
  player = c(rep(1:5, times = 3), 1),
  score = 101:116,
  extraCol = -(1:16)
)

to_pairgames(cr_data)

# Missing values
cr_data_na <- data.frame(
  game = rep(1L, 3),
  player = c(1, NA, NA),
  score = 1:3
)
to_pairgames(cr_data_na)

# Checks
is_pairgames(cr_data)
is_pairgames(to_pairgames(cr_data))




