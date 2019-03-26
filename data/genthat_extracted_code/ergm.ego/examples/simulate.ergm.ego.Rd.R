library(ergm.ego)


### Name: simulate.ergm.ego
### Title: Simulate from a 'ergm.ego' fit.
### Aliases: simulate.ergm.ego
### Keywords: models

### ** Examples


data(faux.mesa.high)
fmh.ego <- as.egodata(faux.mesa.high)
egofit <- ergm.ego(fmh.ego~edges+degree(0:3)+nodefactor("Race")+nodematch("Race")
                         +nodefactor("Sex")+nodematch("Sex")+absdiff("Grade"), 
                          popsize=network.size(faux.mesa.high))
colMeans(egosim <- simulate(egofit, popsize=500,nsim=200,
statsonly=TRUE, control=control.simulate.ergm.ego(
                    simulate.control=control.simulate.formula(MCMC.burnin=2e6))))
colMeans(egosim)/attr(egosim,"ppopsize")*network.size(faux.mesa.high)
summary(faux.mesa.high~edges+degree(0:3)+nodefactor("Race")+nodematch("Race")
                         +nodefactor("Sex")+nodematch("Sex")+absdiff("Grade"))




