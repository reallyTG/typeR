library(bain)


### Name: seBeta
### Title: Standard Errors and CIs for Standardized Regression Coefficients
### Aliases: seBeta
### Keywords: Statistics

### ** Examples

set.seed(123)

R <- matrix(.5, 3, 3)
diag(R) <- 1
X <- sesamesim[, c("peabody", "prenumb", "postnumb")]
y <- sesamesim$age
results <- seBeta(X, y, Nobs = nrow(sesamesim), alpha = .05, estimator = 'ADF')
print(results, digits = 3)
## No test: 
library(MASS)

set.seed(123)

R <- matrix(.5, 3, 3)
diag(R) <- 1
X <- mvrnorm(n = 200, mu = rep(0, 3), Sigma = R, empirical = TRUE)
Beta <- c(.2, .3, .4)
y <- X %*% Beta + .64 * scale(rnorm(200))
results <- seBeta(X, y, Nobs = 200, alpha = .05, estimator = 'ADF')
print(results, digits = 3)
## End(No test)



