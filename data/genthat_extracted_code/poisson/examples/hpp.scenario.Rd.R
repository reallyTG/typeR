library(poisson)


### Name: hpp.scenario
### Title: Simulate an homogeneous Poisson process scenario
### Aliases: hpp.scenario
### Keywords: poisson HPP simulation

### ** Examples

scen = hpp.scenario(rate = 5, num.events = 20, num.sims = 100)
scen@x.bar
plot(scen, main='My HPP Scenario')



