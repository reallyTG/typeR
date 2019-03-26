library(poisson)


### Name: nhpp.scenario
### Title: Simulate a non-homogeneous Poisson process scenario
### Aliases: nhpp.scenario
### Keywords: poisson NHPP simulation

### ** Examples

intensity <- function(t) pmin(t/3, 1)
rate <- 10
num.events <- 100
scen = nhpp.scenario(rate, num.events, num.sims = 100, prob.func=intensity)
scen@x.bar
plot(scen, main='My NHPP Scenario')



