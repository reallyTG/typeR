library(logcondens)


### Name: logcon-package
### Title: Estimate a Log-Concave Probability Density from iid Observations
### Aliases: logcon-package logcon log-concave logcondens
### Keywords: htest nonparametric

### ** Examples

## estimate gamma density
set.seed(1977)
x <- rgamma(100, 2, 1)
res <- logConDens(x, smoothed = FALSE, print = TRUE)
summary(res)

## compare performance to ICMA
res2 <- icmaLogCon(x, T1 = 2000, robustif = TRUE, print = TRUE)

res$L
res2$L

## plot resulting functions
par(mfrow = c(2, 2), mar = c(3, 2, 1, 2))
plot(res, which = "density")
plot(res, which = "log-density")
plot(res, which = "CDF")
plot(res$x, res$H, type = 'l'); rug(res$x)

## compute function values at an arbitrary point
x0 <- (res$x[50] + res$x[51]) / 2
evaluateLogConDens(x0, res)

## compute 0.5 quantile of Fhat
quantilesLogConDens(0.5, res)



