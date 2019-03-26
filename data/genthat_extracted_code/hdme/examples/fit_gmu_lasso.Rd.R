library(hdme)


### Name: fit_gmu_lasso
### Title: Generalized Matrix Uncertainty Lasso
### Aliases: fit_gmu_lasso

### ** Examples

set.seed(1)
# Number of samples
n <- 200
# Number of covariates
p <- 100
# Number of nonzero features
s <- 10
# True coefficient vector
beta <- c(rep(1,s),rep(0,p-s))
# Standard deviation of measurement error
sdU <- 0.2
# True data, not observed
X <- matrix(rnorm(n*p),nrow = n,ncol = p)
# Measured data, with error
W <- X + sdU * matrix(rnorm(n * p), nrow = n, ncol = p)
# Binomial response
y <- rbinom(n, 1, (1 + exp(-X%*%beta))**(-1))
# Run the GMU Lasso
gmu_lasso <- fit_gmu_lasso(W, y, delta = NULL)
# Get an elbow plot, in order to choose delta.
plot(gmu_lasso)





