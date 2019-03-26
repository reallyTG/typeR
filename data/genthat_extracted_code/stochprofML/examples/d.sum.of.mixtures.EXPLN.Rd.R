library(stochprofML)


### Name: d.sum.of.mixtures.EXPLN
### Title: Sums of mixtures of zero, one or more lognormal random variables
###   and one exponential random variable
### Aliases: d.sum.of.mixtures.EXPLN r.sum.of.mixtures.EXPLN
### Keywords: random number generator probability density function mixture
###   of lognormals sum of lognormals stochastic profiling

### ** Examples

# generate random variables
p <- c(0.25,0.75)
mu <- 2
sigma <- 0.3
lambda <- 5

stochprofML:::set.model.functions("EXP-LN")

r <- r.sum.of.mixtures.EXPLN(10^4,10,p,mu,sigma,lambda)
hist(r,xlab="Sum of mixtures of lognormals",freq=FALSE,breaks=100,ylim=c(0,0.2))

# plot according theoretical density function
x <- seq(round(min(r)),round(max(r)),(round(max(r))-round(min(r)))/500)
y <- d.sum.of.mixtures.EXPLN(x,10,p,mu,sigma,lambda,logdens=FALSE)
lines(x,y,col="blue",lwd=3)



