library(weibulltools)


### Name: calculate_ranks
### Title: Computation of Johnson Ranks
### Aliases: calculate_ranks

### ** Examples

  defectives <- c(0, 1, 2, 0, 0, 0, 3, 0, 2, 0)
  n_out <- c(0, 2, 4, 8, 9, 11, 12, 16, 20, 22)
  n <- 23
  johnson_ranks <- calculate_ranks(f = defectives, n_out = n_out, n = n)



