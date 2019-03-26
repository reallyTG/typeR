library(nLTT)


### Name: stretch_nltt_matrix
### Title: Stretch matrix 'm' with a timestep resolution of 'dt'.
### Aliases: stretch_nltt_matrix

### ** Examples

  m <- matrix( c(c(0.0, 1.0), c(0.5, 1.0)), ncol = 2, nrow = 2)
  expected <- matrix(
    c(
      c(0.0, 0.5, 1.0),  # Timepoints
      c(0.5, 0.5, 1.0)   # Values
    ),
    ncol = 2, nrow = 3
  )
  result <- stretch_nltt_matrix(m = m, dt = 0.5, step_type = "lower")
  testit::assert(identical(result, expected))




