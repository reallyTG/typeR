library(endogenous)


### Name: sampselect
### Title: Sample selection model (endogenous probit).
### Aliases: sampselect print.sampselect summary.sampselect

### ** Examples

#- Generate Data -#
require(mvtnorm)
set.seed(1)
N <- 2000
X1 <- rnorm(N, 0, 1);
X2 <- rnorm(N, 0, 1);
X3 <- rnorm(N, 0, 1);
errors <- rmvnorm(N, sigma = 50*matrix(c(1, 0.5, 0.5, 1), nrow = 2))
Y <- 50 + X1 + X2 + errors[,1]
Z <- rep(0, N)
Z[(-5 + X1 + X3 + errors[,2]) > 0] <- 1
Y[Z == 1] <- 0

#- Estimate Model -#
sampselect(Y ~ X1 + X2, probit = Z ~ X1 + X3)

#- Estimate Model with Model-Based Variance -#
sampselect(Y ~ X1 + X2, probit = Z ~ X1 + X3, se = "M")



