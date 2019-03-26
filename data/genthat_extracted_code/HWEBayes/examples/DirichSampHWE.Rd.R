library(HWEBayes)


### Name: DirichSampHWE
### Title: Simulate samples from a Dirichlet prior or posterior under HWE
### Aliases: DirichSampHWE
### Keywords: distribution

### ** Examples

# First sample from the prior
PriorSampHWE <- DirichSampHWE(nvec=rep(0,10),bvec0=rep(1,4),nsim=1000)
par(mfrow=c(1,1))
hist(PriorSampHWE$pvec[,1],xlab="p1",main="")
# Now sample from the posterior
data(DiabRecess)
PostSampHWE <- DirichSampHWE(nvec=DiabRecess,bvec0=rep(1,4),nsim=1000)
par(mfrow=c(1,1))
hist(PostSampHWE$pvec[,1],xlab="p1",main="")



