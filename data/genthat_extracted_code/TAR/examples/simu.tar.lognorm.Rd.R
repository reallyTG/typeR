library(TAR)


### Name: simu.tar.lognorm
### Title: Simulate a series from a log-normal TAR model with Gaussian
###   distributed error for positive valued time series.
### Aliases: simu.tar.lognorm

### ** Examples

set.seed(12345678)
Z<-arima.sim(n=500,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,0.5,-0.3,-0.5,-0.7,NA),nrow=l)
H <- c(1, 1.3)
X <- simu.tar.lognorm(Z,l,r,K,theta,H)
ts.plot(X)




