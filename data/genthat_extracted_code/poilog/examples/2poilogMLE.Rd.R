library(poilog)


### Name: MLE for Poisson lognormal distribution
### Title: Maximum Likelihood Estimation for Poisson Lognormal Distribution
### Aliases: poilogMLE
### Keywords: distribution

### ** Examples

### simulate observations
## Don't show: 
set.seed(200)
## End(Don't show)
n <- rpoilog(S=80,mu=1,sig=2)

### obtain estimates of parameters
est <- poilogMLE(n)

### similar, but now with bootstrapping ###
## Not run: est <- poilogMLE(n,nboot=10)

### change start values and request tracing information 
### from optimization procedure
est <- poilogMLE(n,startVals=c(2,3),
                 control=list(maxit=1000,trace=1, REPORT=1))



