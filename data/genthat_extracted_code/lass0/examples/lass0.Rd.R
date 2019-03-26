library(lass0)


### Name: lass0
### Title: Variable selection for linear regression with Lasso-Zero
### Aliases: lass0

### ** Examples

#### EXAMPLE 1: fast example with 5x10 input matrix and a small number 
#### (MCrep = 50) of Monte Carlo replications for computing QUT.

set.seed(201)
## design matrix
n <- 5
p <- 10
X <- matrix(rnorm(n*p), n, p)
## sparse vector
S0 <- 1:2 # support
beta0 <- rep(0, p)
beta0[S0] <- 2
## response:
y <- X[, S0] %*% beta0[S0] + rnorm(n)
## lasso-zero:
lass0.obj <- lass0(X, y, alpha = 0.05, MCrep = 50)
betahat <- lass0.obj$coefficients
plot(lass0.obj)


#### EXAMPLE 2: with 50x100 input matrix

## No test: 
set.seed(202)
## design matrix
n <- 50
p <- 100
X <- matrix(rnorm(n*p), n, p)
## sparse vector
S0 <- 1:3 # support
beta0 <- rep(0, p)
beta0[S0] <- 2
## response:
y <- X[, S0] %*% beta0[S0] + rnorm(n)

## 1) lasso-zero tuned by QUT with unknown noise level
lass0.obj1 <- lass0(X, y, alpha = 0.05)
betahat1 <- lass0.obj1$coefficients
plot(lass0.obj1)

## 2) lasso-zero tuned by QUT with known noise level
lass0.obj2 <- lass0(X, y, alpha = 0.05, sigma = 1)
betahat2 <- lass0.obj2$coefficients

## 3) lasso-zero with fixed threshold tau = 1
lass0.obj3 <- lass0(X, y, tau = 1)
betahat3 <- lass0.obj3$coefficients
## End(No test)




