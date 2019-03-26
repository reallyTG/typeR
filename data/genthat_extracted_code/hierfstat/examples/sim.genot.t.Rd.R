library(hierfstat)


### Name: sim.genot.t
### Title: Simulate data from a non-equilibrium island model
### Aliases: sim.genot.t

### ** Examples

psize<-c(100,1000,10000,100000,1000000)
dat<-sim.genot.t(nbal=4,nbloc=20,nbpop=5,N=psize,mig=0.001,mut=0.0001,t=100)
summary(wc(dat)) #Weir and cockerham overall estimators of FST & FIS
betas(dat) # Population specific estimator of FST



