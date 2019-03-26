library(tracerer)


### Name: calc_act
### Title: Calculate the auto-correlation time, alternative implementation
### Aliases: calc_act

### ** Examples

  trace <- sin(seq(from = 0.0, to = 2.0 * pi, length.out = 100))
  act <- calc_act(
    trace = trace,
    sample_interval = 1
  )
  testthat::expect_equal(object = act, expected = 38.18202, tolerance = 0.01)



