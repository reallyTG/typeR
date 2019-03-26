library(cmrutils)


### Name: nan2na
### Title: Helper Routine
### Aliases: nan2na
### Keywords: utilities

### ** Examples

  nan2na(Inf)
  nan2na(rep(c(0, -Inf, Inf), 3))
  nan2na(matrix(c(0, Inf, -Inf, 0), 2, 2))
  nan2na(array(c(0, -Inf, Inf, 1, NaN), dim = c(2, 3, 4)))
  nan2na(ts(rep(c(0, -Inf, Inf), 2), frequency = 5))



