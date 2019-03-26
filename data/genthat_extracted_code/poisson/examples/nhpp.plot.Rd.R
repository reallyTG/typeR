library(poisson)


### Name: nhpp.plot
### Title: Plot simulated non-homogeneous Poisson processes
### Aliases: nhpp.plot
### Keywords: poisson NHPP

### ** Examples

intensity <- function(t) pmin(t/3, 1)
nhpp.plot(rate = 5, num.events = 20, num.sims = 100, main='My simulated NHPPs',
          prob.func=intensity)



