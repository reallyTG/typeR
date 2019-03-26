library(endogenous)


### Name: hybrid
### Title: Hybrid model with structural shift (permits covariate-specific
###   treatment effects)
### Aliases: hybrid print.hybrid summary.hybrid

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
Y[Z == 1] <- Y[Z == 1] - 0.5*X1[Z == 1]

#- Estimate Model with No Effect Modification -#
hybrid(Y ~ X1 + X2, probit = Z ~ X1 + X3)

#- Estimate Model with Effect Modification -#
hybrid(Y ~ X1 + X2, probit = Z ~ X1 + X3, modifiers = Z ~ X1)

#- Estimate Model with Effect Modification and Model-Based Variance -#
hybrid(Y ~ X1 + X2, probit = Z ~ X1 + X3, modifiers = Z ~ X1, se = "M")



