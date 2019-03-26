library(mmds)


### Name: sim.mix
### Title: Simulate data from a mixture model detection function
### Aliases: sim.mix

### ** Examples

library(mmds)
set.seed(0)
## simulate some line transect data from a 2 point mixture
sim.dat<-sim.mix(c(-0.223,-1.897,inv.reparam.pi(0.3)),2,100,1)
hist(sim.dat$distance)



