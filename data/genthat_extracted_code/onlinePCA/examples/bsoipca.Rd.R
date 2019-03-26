library(onlinePCA)


### Name: bsoipca
### Title: Block Stochastic Orthononal Iteration (BSOI)
### Aliases: bsoipca

### ** Examples

## Simulate Brownian Motion
n <- 100 # number of sample paths
d <- 50 # number of observation points
x <- matrix(rnorm(n*d,sd=1/sqrt(d)),n,d)
x <- t(apply(x,1,cumsum)) # dim(x) = c(100,50)

q <- 10 # number of PC to compute
B <- 20 # block size

## BSOI PCA 
U <- bsoipca(x, q, B=B, byrow=TRUE) # PCs
lambda <- apply(x %*% U, 2, var) # eigenvalues 



