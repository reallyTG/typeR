library(EAinference)


### Name: MHLS
### Title: Metropolis-Hastings lasso sampler under a fixed active set.
### Aliases: MHLS

### ** Examples

#-------------------------
# Low dim
#-------------------------
set.seed(123)
n <- 10
p <- 5
X <- matrix(rnorm(n * p), n)
Y <- X %*% rep(1, p) + rnorm(n)
sigma2 <- 1
lbd <- .37
weights <- rep(1, p)
LassoResult <- lassoFit(X = X, Y = Y, lbd = lbd, type = "lasso", weights = weights)
B0 <- LassoResult$B0
S0 <- LassoResult$S0
MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
     weights = weights, B0 = B0, S0 = S0, niter = 50, burnin = 0,
     PEtype = "coeff")
MHLS(X = X, PE = rep(0, n), sig2 = 1, lbd = 1,
     weights = weights, B0 = B0, S0 = S0, niter = 50, burnin = 0,
     PEtype = "mu")

#-------------------------
# High dim
#-------------------------
set.seed(123)
n <- 5
p <- 10
X <- matrix(rnorm(n*p),n)
Y <- X %*% rep(1,p) + rnorm(n)
weights <- rep(1,p)
LassoResult <- lassoFit(X = X,Y = Y,lbd = lbd, type = "lasso", weights = weights)
B0 <- LassoResult$B0
S0 <- LassoResult$S0
MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1,
     weights = weights, B0 = B0, S0 = S0, niter = 50, burnin = 0,
     PEtype = "coeff")
MHLS(X = X, PE = rep(0, n), sig2 = 1, lbd = 1,
     weights = weights, B0 = B0, S0 = S0, niter = 50, burnin = 0,
     PEtype = "mu")



