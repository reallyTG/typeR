library(poisson)


### Name: nhpp.sim.slow
### Title: Simulate a non-homogeneous Poisson process.
### Aliases: nhpp.sim.slow
### Keywords: poisson nhhp simulation

### ** Examples

intensity <- function(t) pmin(t/3, 1)
rate <- 10
num.events <- 100
nhpp.sim.slow(rate, num.events, prob.func=intensity)



