library(kader)


### Name: adaptive_fnhat
### Title: Specialized "Workhorse" Function for Kernel Adaptive Density
###   Estimators
### Aliases: adaptive_fnhat

### ** Examples

## Not run: 
##D require(stats)
##D 
##D  # Kernel adaptive density estimators for simulated N(0,1)-data
##D  # computed on an x-grid using the rank transformation and the
##D  # non-robust method:
##D set.seed(2017);     n <- 100;     Xdata <- sort(rnorm(n))
##D x <- seq(-4, 4, by = 0.5);     Sigma <- seq(0.01, 10, length = 51)
##D h <- n^(-1/5)
##D 
##D x.X_h <- outer(x/h, Xdata/h, "-")
##D fnx <- rowMeans(dnorm(x.X_h)) / h   # Parzen-Rosenblatt estim. at
##D                                     # x_j, j = 1, ..., length(x).
##D  # non-robust method:
##D theta.X <- mean(Xdata) - Xdata
##D adaptive_fnhat(x = x, data = Xdata, K = dnorm, h = h, sigma = Sigma,
##D   Ai = x.X_h, Bj = theta.X, fnx = fnx, ticker = TRUE, plot = TRUE)
##D 
##D  # rank transformation-based method (requires sorted data):
##D negJ <- -J_admissible(1:n / n)   # rank trafo
##D adaptive_fnhat(x = x, data = Xdata, K = dnorm, h = h, sigma = Sigma,
##D   Ai = x.X_h, Bj = negJ, fnx = fnx, ticker = TRUE, plot = TRUE)
## End(Not run)




