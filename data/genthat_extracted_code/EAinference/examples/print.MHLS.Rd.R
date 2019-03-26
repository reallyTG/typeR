library(EAinference)


### Name: print.MHLS
### Title: Print Metropolis-Hastings sampler outputs
### Aliases: print.MHLS

### ** Examples

set.seed(123)
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
Result <- MHLS(X = X, PE = rep(0, p), sig2 = sigma2, lbd = lbd, group = 1:p,
     weights = weights, B0 = B0, S0 = S0, niter = 50, burnin = 0,
     type = "coeff")
print(Result)



