library(kader)


### Name: nadwat
### Title: The Classical Nadaraya-Watson Regression Estimator
### Aliases: nadwat

### ** Examples

require(stats)

 # Regression function: a polynomial of degree 4 with one maximum (or
 # minimum), one point of inflection, and one saddle point.
 # Memo: for p(x) = a * (x - x1) * (x - x2)^3 + b the max. (or min.)
 # is at x = (3*x1 + x2)/4, the point of inflection is at x =
 # (x1 + x2)/2, and the saddle point at x = x2.
m <- function(x, x1 = 0, x2 = 8, a = 0.01, b = 0) {
 a * (x - x1) * (x - x2)^3 + b
 }
 # Note: for m()'s default values a minimum is at x = 2, a point
 # of inflection at x = 4, and a saddle point at x = 8.

n <- 100       # Sample size.
set.seed(42)   # To guarantee reproducibility.
X <- runif(n, min = -3, max = 15)      # X_1, ..., X_n
Y <- m(X) + rnorm(length(X), sd = 5)   # Y_1, ..., Y_n

x <- seq(-3, 15, length = 51)   # Where the Nadaraya-Watson estimator
                                # mn of m shall be computed.
mn <- nadwat(x = x, dataX = X, dataY = Y, K = dnorm, h = n^(-1/5))

plot(x = X, y = Y);   rug(X)
lines(x = x, y = mn, col = "blue")  # The estimator.
curve(m, add = TRUE, col = "red")   # The "truth".




