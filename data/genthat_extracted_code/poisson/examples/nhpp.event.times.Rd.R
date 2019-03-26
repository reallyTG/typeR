library(poisson)


### Name: nhpp.event.times
### Title: Simulate non-homogeneous Poisson process event times
### Aliases: nhpp.event.times
### Keywords: poisson NHPP simulation

### ** Examples

rate <- 10
target <- 50
intensity <- function(t) pmin(t/3, 1)
nhpp.event.times(rate, target, intensity)



