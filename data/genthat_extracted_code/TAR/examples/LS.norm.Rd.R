library(TAR)


### Name: LS.norm
### Title: Estimate a Gaussian TAR model using Least Square method given
###   the structural parameters.
### Aliases: LS.norm

### ** Examples

Z<-arima.sim(n=500,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,-0.5,0.5,-0.7,-0.3,NA), nrow=l)
H <- c(1, 1.5)
X <- simu.tar.norm(Z,l,r,K,theta,H)
LS.norm(Z,X,l,r,c(0,0))



