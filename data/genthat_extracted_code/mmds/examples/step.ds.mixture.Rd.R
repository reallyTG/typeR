library(mmds)


### Name: step.ds.mixture
### Title: Stepwise selection of mixture components
### Aliases: step.ds.mixture

### ** Examples

library(mmds)
set.seed(0)
## simulate some line transect data from a 2 point mixture
sim.dat<-sim.mix(c(-0.223,-1.897,inv.reparam.pi(0.3)),2,100,1)
## fit the model
fit.sim.dat.1<-fitmix(sim.dat,1,1)
## find best AIC model
step.ds.mixture(fit.sim.dat.1)



