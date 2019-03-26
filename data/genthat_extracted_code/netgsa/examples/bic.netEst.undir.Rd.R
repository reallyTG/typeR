library(netgsa)


### Name: bic.netEst.undir
### Title: Bayesian information criterion to select the tuning parameters
###   for 'netEst.undir'
### Aliases: bic.netEst.undir

### ** Examples

set.seed(1)
library(MASS)
library(glmnet)
library(glasso)

## Generate the covariance matrix for the AR(1) process 
rho <- 0.5
p <- 100
n <- 100
Sigma <- diag(rep(1,p))
Sigma <- rho^(abs(row(Sigma)-col(Sigma)))/(1-rho^2)

## The inverse covariance matrix is sparse
Omega <- solve(Sigma)

## Generate multivariate normal data n by p
X <- mvrnorm(n, mu=rep(0, p), Sigma=Omega)

## Select the tuning parameters
score = bic.netEst.undir(X, lambda = seq(0.1,1,0.1))




