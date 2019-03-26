library(kader)


### Name: var_ES2012
### Title: Variance Estimator of Eichner & Stute (2012)
### Aliases: var_ES2012

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

mnX  <- nadwat(x = X, dataX = X, dataY = Y, K = dnorm, h = h) # m_n(X_i)
                                                     # for i = 1, ..., n.
 # Estimator of Var_x0(sigma) on the sigma-grid:
(Vn <- var_ES2012(sigma = Sigma, h = h, xXh = (x0 - X) / h,
  thetaXh = (mean(X) - X) / h, K = dnorm, YmDiff2 = (Y - mnX)^2))

## Not run: 
##D  # Visualizing the estimator of Var_n(sigma) at x0 on the sigma-grid:
##D plot(Sigma, Vn, type = "o", xlab = expression(sigma), ylab = "",
##D   main = bquote(widehat("Var")[n](sigma)~~"at"~~x==.(x0)))
## End(Not run)




