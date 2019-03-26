library(poisson)


### Name: nhpp.mean.event.times
### Title: Expected event times of a non-homogeneous Poisson process.
### Aliases: nhpp.mean.event.times
### Keywords: poisson NHPP

### ** Examples

intensity <- function(t) pmin(t/3, 1)
rate <- 10
nhpp.mean.event.times(rate, 50, prob.func = intensity)



