library(poilog)


### Name: MLE for bivariate Poisson lognormal distribution
### Title: Maximum Likelihood Estimation for Bivariate Poisson Lognormal
###   Distribution
### Aliases: bipoilogMLE
### Keywords: distribution

### ** Examples

## Don't show: 
set.seed(200)
## End(Don't show)
## simulate observations
xy  <- rbipoilog(S=30,mu1=1,mu2=1,sig1=2,sig2=2,rho=0.5)

## obtain estimates of parameters
est <- bipoilogMLE(xy)

## similar, but now with bootstrapping 
## Not run: est <- bipoilogMLE(xy,nboot=10)

## change start values and request tracing information 
## from optimization procedure
est <- bipoilogMLE(xy,startVals=c(2,2,4,4,0.3),
       control=list(maxit=1000,trace=1, REPORT=1))

## effect of sampling intensity 
xy  <- rbipoilog(S=100,mu1=1,mu2=1,sig1=2,sig2=2,rho=0.5,nu1=0.5,nu2=0.5)
est <- bipoilogMLE(xy)
## the expected estimates of mu1 and mu2 are now 1-log(0.5) = 0.3 (approximately) 





