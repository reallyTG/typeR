library(mmds)


### Name: fitmix
### Title: Mixture Model Distance Detection Function Fitting
### Aliases: fitmix

### ** Examples

library(mmds)
set.seed(0)
## simulate some line transect data from a 2 point mixture
sim.dat<-sim.mix(c(-0.223,-1.897,inv.reparam.pi(0.3)),2,100,1)
## fit the model
fit.sim.dat<-fitmix(sim.dat,1,2)
## what happened?
summary(fit.sim.dat)



