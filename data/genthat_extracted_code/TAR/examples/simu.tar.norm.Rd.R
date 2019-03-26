library(TAR)


### Name: simu.tar.norm
### Title: Simulate a series from a TAR model with Gaussian distributed
###   error.
### Aliases: simu.tar.norm

### ** Examples

Z<-arima.sim(n=500,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,-0.5,0.5,-0.7,-0.3,NA),nrow=l)
H <- c(1, 1.5)
X <- simu.tar.norm(Z,l,r,K,theta,H)
ts.plot(X)




