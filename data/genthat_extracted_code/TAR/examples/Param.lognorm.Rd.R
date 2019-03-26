library(TAR)


### Name: Param.lognorm
### Title: Estimate a TAR model using Gibbs Sampler given the structural
###   parameters.
### Aliases: Param.lognorm

### ** Examples

 # Example 1, TAR model with 2 regimes
 #' set.seed(12345678)
Z<-arima.sim(n=500,list(ar=c(0.5)))
l <- 2
r <- 0
K <- c(2,1)
theta <- matrix(c(1,0.5,-0.3,-0.5,-0.7,NA),nrow=l)
H <- c(1, 1.3)
X <- simu.tar.lognorm(Z,l,r,K,theta,H)
# res <- Param.lognorm(Z,X,l,r,K)

# Example 2, TAR model with 3 regimes
Z<-arima.sim(n=300, list(ar=c(0.5)))
l <- 3
r <- c(-0.6, 0.6)
K <- c(1, 2, 1)
theta <- matrix(c(1,0.5,-0.5,-0.5,0.2,-0.7,NA, 0.5,NA), nrow=l)
H <- c(1, 1.5, 2)
X <- simu.tar.lognorm(Z, l, r, K, theta, H)
# res <- Param.lognorm(Z,X,l,r,K)



