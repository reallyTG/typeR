library(hierfstat)


### Name: betas
### Title: Estimate betas per population and a bootstrap confidence
###   interval
### Aliases: betas

### ** Examples

dat<-sim.genot(size=100,N=c(100,1000,10000),nbloc=50,nbal=10)
betas(dat,nboot=100)$ci



