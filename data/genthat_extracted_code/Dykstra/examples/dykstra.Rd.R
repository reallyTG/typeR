library(Dykstra)


### Name: dykstra
### Title: Solve a Quadratic Programming Problem via Dykstra's Algorithm
### Aliases: dykstra
### Keywords: optimize

### ** Examples

###  EXAMPLE 1: Generic Quadratic Programming Problem  ###

# constraint 1 (equality): coefficients sum to 1
# constraints 2-4 (inequality): coefficients non-negative

# define QP problem
Dmat <- diag(3)
dvec <- c(1, 1.5, 1)
Amat <- cbind(rep(1, 3), diag(3))
bvec <- c(1, 0, 0, 0)

# solve QP problem
dykstra(Dmat, dvec, Amat, bvec, meq = 1)

# solve QP problem (factorized = TRUE)
dykstra(Dmat, dvec, Amat, bvec, meq = 1, factorized = TRUE)



###  EXAMPLE 2: Regression with Non-Negative Coefficients  ###

# generate regression data
set.seed(1)
nobs <- 100
nvar <- 5
X <- matrix(rnorm(nobs*nvar), nobs, nvar)
beta <- c(0, 1, 0.3, 0.7, 0.1)
y <- X %*% beta + rnorm(nobs)

# define QP problem
Dmat <- crossprod(X)
dvec <- crossprod(X, y)
Amat <- diag(nvar)

# solve QP problem
dykstra(Dmat, dvec, Amat)

# solve QP problem (factorized = TRUE)
Rmat <- chol(Dmat)
Rinv <- solve(Rmat)
dykstra(Rinv, dvec, Amat, factorized = TRUE)



###  EXAMPLE 3: Isotonic Regression  ###

# generate regression data
set.seed(1)
n <- 50
x <- 1:n
y <- log(x) + rnorm(n)

# define QP problem
Dmat <- diag(n)
Amat <- Dmat[, 2:n] - Dmat[, 1:(n-1)]

# solve QP problem
dyk <- dykstra(Dmat, y, Amat)
dyk

# plot results
plot(x, y)
lines(x, dyk$solution)



###  EX 4: Large Non-Negative Quadratic Program  ###

# define QP problem
set.seed(1)
n <- 1000
Dmat <- Amat <- diag(n)
dvec <- runif(n, min = -2)

# solve QP problem with dykstra
dyk <- dykstra(Dmat, dvec, Amat)
dyk




