library(BayesComm)


### Name: devpart
### Title: Deviance partitioning
### Aliases: devpart

### ** Examples

# create fake data
n <- 100
nsp <- 4
k <- 3

X <- matrix(c(rep(1, n), rnorm(n * k)), n)  # covariate matrix
W <- matrix(rnorm(nsp * nsp), nsp)
W <- W %*% t(W) / 2  # true covariance matrix
B <- matrix(rnorm(nsp * (k + 1), 0, 3), nsp)  # true covariates
mu <- apply(B, 1, function(b, x) x %*% b, X)  # true mean
e <- matrix(rnorm(n * nsp), n) %*% chol(W)  # true e
z <- mu + e  # true z
Y <- ifelse(z > 0, 1, 0)  # true presence/absence

# run BC (after removing intercept column from design matrix)
null <- BC(Y, X[, -1], model = "null", its = 100)
comm <- BC(Y, X[, -1], model = "community",its = 100)
envi <- BC(Y, X[, -1], model = "environment", its = 100)
full <- BC(Y, X[, -1], model = "full", its = 100)

devpart(null, envi, comm, full)



