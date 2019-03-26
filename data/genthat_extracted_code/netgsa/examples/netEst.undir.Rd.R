library(netgsa)


### Name: netEst.undir
### Title: Constrained estimation of undirected networks
### Aliases: netEst.undir

### ** Examples

library(MASS)
library(glmnet)
library(glasso)
set.seed(1)

## Generate the covariance matrix for the AR(1) process 
rho <- 0.5
p <- 100
n <- 100
Sigma <- diag(rep(1,p))
Sigma <- rho^(abs(row(Sigma)-col(Sigma)))/(1-rho^2)

## The inverse covariance matrix is sparse
Omega <- solve(Sigma)

## Generate multivariate normal data
X <- mvrnorm(n, mu=rep(0, p), Sigma=Omega)

## Estimate the network without external information
fit <- netEst.undir(X, lambda = 0.2)

## Estimate the network with external information
##-Not run-
ones = edgelist2adj(file="edgelist.txt", vertex.names=paste0("gene", 1:p), 
mode="undirected")
zeros = edgelist2adj(file="nonedgelist.txt", vertex.names=paste0("gene", 1:p), 
mode="undirected")

fit.undir <- netEst.undir(X, zero=zeros, one=ones, lambda = 0.5)

## Estimate the network when the known edges are not entirely reliable. 
ones[1,10:11] = 1
ones[10:11,1] = 1
fit.undir <- netEst.undir(X, zero=zeros, one=ones, weight = 0.1, lambda = 0.2)



