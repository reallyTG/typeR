library(nonmem2R)


### Name: grid.sim
### Title: Combine fix grid and simulated grid based on multivariate normal
###   distribution
### Aliases: grid.sim

### ** Examples

sigma<-matrix(c(1,0.5,0.5,2),ncol=2)
sim1<-grid.sim(1000,sigma=sigma)
pairs(sim1)
cov(sim1)



