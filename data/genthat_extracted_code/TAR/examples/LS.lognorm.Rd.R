library(TAR)


### Name: LS.lognorm
### Title: Estimate a log-normal TAR model using Least Square method given
###   the structural parameters.
### Aliases: LS.lognorm

### ** Examples

Z<-arima.sim(n=500,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,0.5,-0.3,-0.5,-0.7,NA),nrow=l)
H <- c(1, 1.3)
X <- simu.tar.lognorm(Z,l,r,K,theta,H)
ts.plot(X)
LS.lognorm(Z,X,l,r,K)



