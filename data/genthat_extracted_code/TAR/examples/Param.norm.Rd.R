library(TAR)


### Name: Param.norm
### Title: Estimate a Gaussian TAR model using Gibbs Sampler given the
###   structural parameters.
### Aliases: Param.norm

### ** Examples

 # Example 1, TAR model with 2 regimes
Z<-arima.sim(n=500,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,-0.5,0.5,-0.7,-0.3,NA), nrow=l)
H <- c(1, 1.5)
X <- simu.tar.norm(Z,l,r,K,theta,H)
# res <- Param.norm(Z,X,l,r,K)

# Example 2, TAR model with 3 regimes
Z<-arima.sim(n=300, list(ar=c(0.5)))
l <- 3
r <- c(-0.6, 0.6)
K <- c(1, 2, 1)
theta <- matrix(c(1,0.5,-0.5,-0.5,0.2,-0.7,NA, 0.5,NA), nrow=l)
H <- c(1, 1.5, 2)
X <- simu.tar.norm(Z, l, r, K, theta, H)
# res <- Param.norm(Z,X,l,r,K)



