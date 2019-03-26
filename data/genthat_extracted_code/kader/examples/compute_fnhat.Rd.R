library(kader)


### Name: compute_fnhat
### Title: "Unified" Function for Kernel Adaptive Density Estimators
### Aliases: compute_fnhat

### ** Examples

require(stats)

 # The kernel density estimators for simulated N(0,1)-data and a single
 # sigma-value evaluated on a grid using the rank transformation and
 # the non-robust method:
set.seed(2017);     n <- 100;     Xdata <- rnorm(n)
xgrid <- seq(-4, 4, by = 0.1)
negJ <- -J_admissible(1:n / n)                 # The rank trafo requires
compute_fnhat(x = xgrid, data = sort(Xdata),   # sorted data!
  K = dnorm, h = n^(-1/5), Bj = negJ, sigma = 1)

theta.X <- mean(Xdata) - Xdata    # non-robust method
compute_fnhat(x = xgrid, data = Xdata, K = dnorm, h = n^(-1/5),
  Bj = theta.X, sigma = 1)




