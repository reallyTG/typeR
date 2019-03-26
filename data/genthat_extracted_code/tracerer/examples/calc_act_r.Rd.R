library(tracerer)


### Name: calc_act_r
### Title: Calculate the auto-correlation time using only R. Consider using
###   calc_act instead, as it is orders of magnitude faster
### Aliases: calc_act_r

### ** Examples

  trace <- sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100))
  act <- calc_act_r(
    trace = trace,
    sample_interval = 1
  )
  testthat::expect_equal(object = act, expected = 38.18202, tolerance = 0.01)



