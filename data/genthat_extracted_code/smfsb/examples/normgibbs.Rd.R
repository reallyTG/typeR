library(smfsb)


### Name: normgibbs
### Title: A simple Gibbs sampler for Bayesian inference for the mean and
###   precision of a normal random sample
### Aliases: normgibbs
### Keywords: smfsb

### ** Examples

postmat=normgibbs(N=1100,n=15,a=3,b=11,cc=10,d=1/100,xbar=25,ssquared=20)
postmat=postmat[101:1100,]
op=par(mfrow=c(3,3))
plot(postmat)
plot(postmat,type="l")
plot.new()
plot(ts(postmat[,1]))
plot(ts(postmat[,2]))
plot(ts(sqrt(1/postmat[,2])))
hist(postmat[,1],30)
hist(postmat[,2],30)
hist(sqrt(1/postmat[,2]),30)
par(op)



