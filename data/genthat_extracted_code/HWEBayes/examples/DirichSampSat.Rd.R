library(HWEBayes)


### Name: DirichSampSat
### Title: Simulate samples from a Dirichlet prior or posterior under the
###   saturated model
### Aliases: DirichSampSat
### Keywords: distribution

### ** Examples

# First sample from the prior
PriorSampSat <- DirichSampSat(nvec=rep(0,10),bvec=rep(1,10),nsim=1000)
par(mfrow=c(1,2))
hist(PriorSampSat$pvec[,1],xlab="p1",main="")
hist(PriorSampSat$fixind[,2,1],xlab="f21",main="")
# Now sample from the posterior
data(DiabRecess)
PostSampSat <- DirichSampSat(nvec=DiabRecess,bvec=rep(1,10),nsim=1000)
par(mfrow=c(1,2))
hist(PostSampSat$pvec[,1],xlab="p1",main="")
hist(PostSampSat$fixind[,2,1],xlab="f21",main="")



