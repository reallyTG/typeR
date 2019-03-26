library(aSPC)


### Name: aSPC
### Title: An adaptive sum of powered correlation test (aSPC) for
###   association between two random vectors
### Aliases: aSPC

### ** Examples

library(mvtnorm)
sigma = diag(0.9, 10) + 0.1
n = 50 # sample size
Z = rmvnorm(n=n, mean=rep(0,10), sigma=sigma)
X = rmvnorm(n=n, mean=rep(0,15), sigma=diag(1, 15))
Y = rmvnorm(n=n, mean=rep(0,15), sigma=diag(1, 15))
X = as.data.frame(cbind(Z[,1:5], X))
Y = as.data.frame(cbind(Z[,6:10], Y))
set.seed(123) # to ensure we can replicate the permutation P-value
p = 2; q = 2; n=50
X = rmvnorm(n=n, mean=rep(0,p), sigma=diag(1, p))
Y = rmvnorm(n=n, mean=rep(0,q), sigma=diag(1, q))
a = proc.time()
aSPC(X, Y, pow = c(1:8, Inf), B = 1000, method = "pearson")
proc.time() - a

#' a = proc.time()
aSPC(X, Y, pow = c(1:8, Inf), B = 1000, method = "spearman")
proc.time() - a

a = proc.time()
aSPC(X, Y, pow = c(1:8, Inf), B = 500, method = "dcor")
proc.time() - a



