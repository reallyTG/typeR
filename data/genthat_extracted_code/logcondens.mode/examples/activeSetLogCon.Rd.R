library(logcondens.mode)


### Name: activeSetLogCon
### Title: Computes a Log-Concave Probability Density Estimate via an
###   Active Set Algorithm
### Aliases: activeSetLogCon activeSet
### Keywords: htest nonparametric

### ** Examples

## estimate gamma density
set.seed(1977)
n <- 200
x <- rgamma(n, 2, 1)
res <- activeSetLogCon(x, w = rep(1 / n, n), print = FALSE)

## plot resulting functions
par(mfrow = c(2, 2), mar = c(3, 2, 1, 2))
plot(res$x, exp(res$phi), type = 'l'); rug(x)
plot(res$x, res$phi, type = 'l'); rug(x)
plot(res$x, res$Fhat, type = 'l'); rug(x)
plot(res$x, res$H, type = 'l'); rug(x)

## compute and plot function values at an arbitrary point
x0 <- (res$x[100] + res$x[101]) / 2
Fx0 <- evaluateLogConDens(x0, res, which = 3)[, "CDF"]
plot(res$x, res$Fhat, type = 'l'); rug(res$x)
abline(v = x0, lty = 3); abline(h = Fx0, lty = 3)

## compute and plot 0.9-quantile of Fhat
q <- quantilesLogConDens(0.9, res)[2]
plot(res$x, res$Fhat, type = 'l'); rug(res$x)
abline(h = 0.9, lty = 3); abline(v = q, lty = 3)



