library(tracerer)


### Name: calc_stderr_mean
### Title: Calculate the standard error of the mean
### Aliases: calc_stderr_mean

### ** Examples

  trace <- sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100))
  stderr_mean <- calc_stderr_mean(trace)
  testthat::expect_equal(stderr_mean, expected = 0.4347425, tolerance = 0.01)



