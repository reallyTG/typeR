library(statar)


### Name: sum_up
### Title: Gives summary statistics (corresponds to Stata command
###   summarize)
### Aliases: sum_up

### ** Examples

library(dplyr)
N <- 100
df <- data_frame(
  id = 1:N,
  v1 = sample(5, N, TRUE),
  v2 = sample(1e6, N, TRUE)
)
sum_up(df)
sum_up(df, v2, d = TRUE)
sum_up(df, v2, wt = v1)
df %>% group_by(v1) %>% sum_up(starts_with("v"))



