library(stochprofML)


### Name: d.sum.of.mixtures.LNLN
### Title: Sums of mixtures of lognormal random variables
### Aliases: d.sum.of.mixtures.LNLN r.sum.of.mixtures.LNLN
### Keywords: random number generator probability density function mixture
###   of lognormals sum of lognormals stochastic profiling

### ** Examples

# generate random variables
p <- c(0.25,0.75)
mu <- c(2,-1)
sigma <- c(0.3,0.1)

stochprofML:::set.model.functions("LN-LN")

r <- r.sum.of.mixtures.LNLN(10^4,10,p,mu,sigma)
hist(r,xlab="Sum of mixtures of lognormals",freq=FALSE,breaks=100,ylim=c(0,0.2))

# plot according theoretical density function
x <- seq(round(min(r)),round(max(r)),(round(max(r))-round(min(r)))/500)
y <- d.sum.of.mixtures.LNLN(x,10,p,mu,sigma,logdens=FALSE)
lines(x,y,col="blue",lwd=3)



