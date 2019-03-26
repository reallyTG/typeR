library(poisson)


### Name: nhpp.sim
### Title: Simulate non-homogeneous Poisson process(es)
### Aliases: nhpp.sim
### Keywords: poisson nhhp simulation

### ** Examples

intensity <- function(t) pmin(t/3, 1)
rate <- 10
num.events <- 100
nhpp.sim(rate, num.events, prob.func=intensity)



