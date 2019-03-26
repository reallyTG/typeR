library(poisson)


### Name: plotprocesses
### Title: Plot simulated process paths
### Aliases: plotprocesses
### Keywords: poisson

### ** Examples

scen = hpp.scenario(rate = 5, num.events = 20, num.sims = 100)
plotprocesses(scen@x, main='My HPP paths')



