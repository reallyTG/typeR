library(kader)


### Name: kade
### Title: Kernel Adaptive Density Estimator
### Aliases: kade

### ** Examples

require(stats)

 # Generating N(0,1)-data
set.seed(2017);     n <- 80;     d <- rnorm(n)

 # Estimating f(x0) for one sigma-value
x0 <- 1
(fit <- kade(x = x0, data = d, method = "nonrobust", Sigma = 1))
## No test: 
 # Estimating f(x0) for sigma-grid
x0 <- 1
(fit <- kade(x = x0, data = d, method = "nonrobust",
  Sigma = seq(0.01, 10, length = 10), ticker = TRUE))
## End(No test)
## Not run: 
##D  # Estimating f(x0) for sigma-grid and Old-Faithful-eruptions-data
##D x0 <- 2
##D (fit <- kade(x = x0, data = faithful$eruptions, method = "nonrobust",
##D   Sigma = seq(0.01, 10, length = 51), ticker = TRUE, plot = TRUE))
## End(Not run)



