library(logcondens)


### Name: quantilesLogConDens
### Title: Function to compute Quantiles of Fhat
### Aliases: quantilesLogConDens
### Keywords: htest nonparametric

### ** Examples

## estimate gamma density
set.seed(1977)
x <- rgamma(200, 2, 1)
res <- logConDens(x, smoothed = FALSE, print = FALSE)

## compute 0.95 quantile of Fhat
q <- quantilesLogConDens(0.95, res)[, "quantile"]
plot(res, which = "CDF", legend.pos = "none")
abline(h = 0.95, lty = 3); abline(v = q, lty = 3)



