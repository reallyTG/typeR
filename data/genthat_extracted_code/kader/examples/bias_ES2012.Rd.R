library(kader)


### Name: bias_ES2012
### Title: Bias Estimator of Eichner & Stute (2012)
### Aliases: bias_ES2012

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

 # m_n(x_0) and m_n(X_i) for i = 1, ..., n:
mn <- nadwat(x = c(x0, X), dataX = X, dataY = Y, K = dnorm, h = h)

 # Estimator of Bias_x0(sigma) on the sigma-grid:
(Bn <- bias_ES2012(sigma = Sigma, h = h, xXh = (x0 - X) / h,
  thetaXh = (mean(X) - X) / h, K = dnorm, mmDiff = mn[-1] - mn[1]))

## Not run: 
##D  # Visualizing the estimator of Bias_n(sigma) at x on the sigma-grid:
##D plot(Sigma, Bn, type = "o", xlab = expression(sigma), ylab = "",
##D   main = bquote(widehat("Bias")[n](sigma)~~"at"~~x==.(x0)))
## End(Not run)




