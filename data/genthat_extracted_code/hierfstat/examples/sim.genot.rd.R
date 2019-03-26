library(hierfstat)


### Name: sim.genot
### Title: Simulates genotypes in an island model at equilibrium
### Aliases: sim.genot

### ** Examples

dat<-sim.genot(nbpop=4,nbal=20,nbloc=10,mig=0.001,mut=0.0001,N=c(100,100,1000,1000),f=0)
betas(dat)$betaiovl



