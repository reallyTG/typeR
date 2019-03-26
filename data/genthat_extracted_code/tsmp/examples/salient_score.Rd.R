library(tsmp)


### Name: salient_score
### Title: Computes the F-Score of salient algorithm.
### Aliases: salient_score

### ** Examples

# toy example
  data <- mp_toy_data$data[, 1]
  mp <- tsmp(data, window_size = 30, verbose = 0)
  mps <- salient_subsequences(mp, n_bits = c(4, 6, 8), verbose = 0)
  label_idx <- seq(2, 500, by = 110) # fake data
  salient_score(mps, label_idx)



