library(lmeVarComp)


### Name: rlr.test
### Title: Restricted Likelihood Ratio Test and Generalized F-test for Zero
###   Variance Components
### Aliases: rlr.test

### ** Examples

# two-way random effects ANOVA
n1 <- 5L
n2 <- 6L
n0 <- 4L
n <- n1 * n2 * n0
X <- cbind(rep(1, n))
A <- gl(n1, n2 * n0)
Z1 <- model.matrix(~ -1 + A, contrasts.arg = contr.treatment)
B <- rep(gl(n2, n0), n1)
Z2 <- model.matrix(~ -1 + B, contrasts.arg = contr.treatment)
Z3 <- model.matrix(~ -1 + B : A, contrasts.arg = contr.treatment)
set.seed(1L)
Y <- (X %*% 1
  + Z1 %*% rnorm(ncol(Z1), 0, 0.7)
  + Z2 %*% rnorm(ncol(Z2), 0, 0.3)
  + Z3 %*% rnorm(ncol(Z3), 0, 0.5)
  + rnorm(n, 0, 1))
Z <- list(Z1, Z2, Z3)
Sigma <- lapply(Z, function(z) diag(ncol(z)))
# tests interaction effects
rlr.test(Y, X, Z, Sigma, 2L, 2000L, 2L)
# tests overall effects
rlr.test(Y, X, Z, Sigma, 1L, 2000L, 3L)



