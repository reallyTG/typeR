library(cmvnorm)


### Name: Mvcnorm
### Title: Multivariate complex Gaussian density and random deviates
### Aliases: Mvcnorm dcmvnorm rcmvnorm rcnorm
### Keywords: distribution multivariate complex

### ** Examples


S <- emulator::cprod(rcmvnorm(3,mean=c(1,1i),sigma=diag(2)))

rcmvnorm(10,sigma=S)
rcmvnorm(10,mean=c(0,1+10i),sigma=S)


# Now try and estimate the mean (viz 1,1i) and variance (S) from a
#  random sample:


n <- 101
z <- rcmvnorm(n,mean=c(0,1+10i),sigma=S)
xbar <- colMeans(z)
Sbar <- cprod(sweep(z,2,xbar))/n







