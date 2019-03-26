library(mgcv)


### Name: rmvn
### Title: Generate multivariate normal deviates
### Aliases: rmvn
### Keywords: models regression

### ** Examples

library(mgcv)
V <- matrix(c(2,1,1,2),2,2) 
mu <- c(1,3)
n <- 1000
z <- rmvn(n,mu,V)
crossprod(sweep(z,2,colMeans(z)))/n ## observed covariance matrix
colMeans(z) ## observed mu 



