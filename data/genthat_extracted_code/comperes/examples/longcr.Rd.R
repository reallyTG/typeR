library(comperes)


### Name: longcr
### Title: Long format of competition results
### Aliases: longcr is_longcr as_longcr as_tibble.longcr

### ** Examples

# Repairing example
cr_data <- data.frame(
  playerscoregame_ID = rep(1:5, times = 2),
  gameId = rep(1:5, each = 2),
  scoreS = 31:40,
  scoreSS = 41:50
)
cr_data_long <- as_longcr(cr_data, repair = TRUE)

is_longcr(cr_data_long)

as_tibble(cr_data_long)




