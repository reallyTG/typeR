library(OrdMonReg)


### Name: BoundedAntiMean, BoundedIsoMean
### Title: Compute least square estimate of an iso- or antitonic function,
###   bounded below and above by fixed functions
### Aliases: BoundedIsoMean BoundedAntiMean
### Keywords: regression nonparametric

### ** Examples

## --------------------------------------------------------
## generate data
## --------------------------------------------------------
set.seed(23041977)
n <- 35
x <- 1:n / n
f0 <- - 3 * x + 5
g0 <- 1 / (x + 0.5) ^ 2 + 1 
g <- g0 + 3 * rnorm(n)

## --------------------------------------------------------
## compute estimate
## --------------------------------------------------------
g_est <- BoundedAntiMean(g, w = rep(1 / n, n), a = -rep(Inf, n), b = f0)

## --------------------------------------------------------
## plot observations and estimate
## --------------------------------------------------------
par(mar = c(4.5, 4, 3, 0.5))
plot(0, 0, type = 'n', main = "Observations, upper bound and estimate 
    for bounded antitonic regression", xlim = c(0, max(x)), ylim = 
    range(c(f0, g)), xlab = expression(x), ylab = "observations and estimate")
points(x, g, col = 1)
lines(x, g0, col = 1, lwd = 2, lty = 2)
lines(x, f0, col = 2, lwd = 2, lty = 2)
lines(x, g_est, col = 3, lwd = 2)
legend("bottomleft", c("truth", "data", "upper bound", "estimate"), 
    lty = c(1, 0, 1, 1), lwd = c(2, 1, 2, 2), pch = c(NA, 1, NA, NA), 
    col = c(1, 1:3), bty = 'n')
    
## Not run: 
##D ## --------------------------------------------------------
##D ## 'BoundedIsoMean' is a generalization of 'isoMean' in the 
##D ## package 'logcondens'
##D ## --------------------------------------------------------
##D library(logcondens)
##D n <- 50
##D y <- sort(runif(n, 0, 1)) ^ 2 + rnorm(n, 0, 0.2)
##D 
##D isoMean(y, w = rep(1 / n, n))
##D BoundedIsoMean(y, w = rep(1 / n, n), a = -rep(Inf, n), b = rep(Inf, n))
## End(Not run)    



