library(EAinference)


### Name: plot.MHLS
### Title: Plot Metropolis-Hastings sampler outputs
### Aliases: plot.MHLS

### ** Examples

#' set.seed(123)
n <- 10
p <- 5
X <- matrix(rnorm(n * p), n)
Y <- X %*% rep(1, p) + rnorm(n)
sigma2 <- 1
lbd <- .37
weights <- rep(1, p)
LassoResult <- lassoFit(X = X, Y = Y, lbd = lbd, type="lasso", weights = weights)
B0 <- LassoResult$B0
S0 <- LassoResult$S0
plot(MHLS(X = X, PE = rep(0, p), sig2 = 1, lbd = 1, group = 1:p,
     weights = weights, B0 = B0, S0 = S0, niter = 50, burnin = 0,
     type = "coeff"))



