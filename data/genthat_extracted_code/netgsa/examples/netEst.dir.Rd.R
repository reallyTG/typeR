library(netgsa)


### Name: netEst.dir
### Title: Constrained estimation of directed networks
### Aliases: netEst.dir

### ** Examples

library(MASS)
library(glmnet)
set.seed(1)

p <- 100 # number of variables
s <- 0.1 # probability of having an edge in the adjacency matrix
rho <- 0.6 # edge weights

## form an adjacency matrix
A <- matrix(rbinom(p*p,1,s),p,p)
A[upper.tri(A)] = 0

I <- diag(rep(1,p))

## generate data (see Shojaie & Michaildis, 2010b)
n <- 100
X <- solve(I-rho*A) 
X <- t(X)
X <- scale(X)

zeros <- matrix(0,p,p)
ones <- matrix(0,p,p)

zeros[5,1] <- zeros[10,1] <- 1
ones[4,1] <- ones[11,2] <- 1

fit.dir <- netEst.dir(X=X, zero=zeros, one=ones, lambda=0.1)



