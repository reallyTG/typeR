library(HybridMC)


### Name: hybridMC
### Title: Sample from a (log)density using hybrid Monte Carlo
### Aliases: hybridMC
### Keywords: distribution multivariate misc

### ** Examples


#### Example 1: Jointly sample from two independent double exponentials

## log density function for double exponential
L = function(x)
-sum(abs(x))

dL = function(x)
-sign(x)

startVal=c(-1,1)
samples = hybridMC(y.start=startVal, n.samp=5000, logDens=L, dLogDens=dL, epsilon=.2, LFsteps=10)

# Plot the MCMC chains and densities
plot(samples)

# Plot a histogram of the first variable, with true density
hist(samples[,1],freq=FALSE,breaks=50)
x = seq(-5,5,len=100)
lines(x,.5*dexp(abs(x)),col="red") #true density in red

# Autocorrelation function
acf(samples)




