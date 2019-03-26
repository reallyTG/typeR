library(kader)


### Name: weights_ES2012
### Title: Weights W_{ni} of Eichner & Stute (2012)
### Aliases: weights_ES2012

### ** Examples

require(stats)

 # Regression function:
m <- function(x, x1 = 0, x2 = 8, a = 0.01, b = 0) {
 a * (x - x1) * (x - x2)^3 + b
}
 # Note: For a few details on m() see examples in ?nadwat.

n <- 100       # Sample size.
set.seed(42)   # To guarantee reproducibility.
X <- runif(n, min = -3, max = 15)      # X_1, ..., X_n   # Design.
Y <- m(X) + rnorm(length(X), sd = 5)   # Y_1, ..., Y_n   # Response.

h <- n^(-1/5)
Sigma <- seq(0.01, 10, length = 51)   # sigma-grid for minimization.
x0 <- 5   # Location at which the estimator of m should be computed.

 # Weights (W_{ni}(x; \sigma_r))_{1<=r<=length(Sigma), 1<=i<=n} for
 # Var_n(sigma) and Bias_n(sigma) each at x0 on the sigma-grid:
weights_ES2012(sigma = Sigma, xXh = (x0 - X) / h,
  thetaXh = (mean(X) - X) / h, K = dnorm, h = h)




