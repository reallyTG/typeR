library(logcondens.mode)


### Name: activeSetLogCon.mode
### Title: Computes the Modally-Constrained Log-Concave Probability Density
###   Maximum Likelihood Estimate via an Active Set Algorithm.
### Aliases: activeSetLogCon.mode
### Keywords: htest nonparametric

### ** Examples

## estimate gamma density

set.seed(1977)
n <- 200
x <- rgamma(n, 2, 1)
TRUEMODE <- 1; ## (2-1)*1
res <- activeSetLogCon.mode(x, mode=TRUEMODE, w = rep(1 / n, n), print = FALSE)

## plot resulting functions
par(mfrow = c(2, 2), mar = c(3, 2, 1, 2))
plot(res$x, res$fhat, type = 'l'); rug(res$xn)
plot(res$x, res$phi, type = 'l'); rug(res$xn)
plot(res$x, res$Fhat, type = 'l'); rug(res$xn)
plot(res$x, res$H, type = 'l'); rug(res$xn)

## Or can use the ".f" functions 
xpts <- seq(from=0, to=9, by=.01)
par(mfrow = c(2, 2), mar = c(3, 2, 1, 2))
plot(xpts, res$fhat.f(xpts), type = 'l'); rug(res$xn) 
plot(xpts, res$phi.f(xpts), type = 'l'); rug(res$xn) 
## these are not analogous to res$H.
plot(xpts, res$EL.f(upper=xpts), type = 'l'); rug(res$xn) 
plot(xpts, res$ER.f(lower=xpts), type = 'l'); rug(res$xn)


## compute and plot function values at an arbitrary point
x0 <- (res$x[100] + res$x[101]) / 2
Fx0 <- evaluateLogConDens(x0, res, which = 3)[, "CDF"]
plot(res$x, res$Fhat, type = 'l'); rug(res$x)
abline(v = x0, lty = 3); abline(h = Fx0, lty = 3)

## compute and plot 0.9-quantile of Fhat
alpha <- .1
q <- quantilesLogConDens(1-alpha, res)[2]
plot(res$x, res$Fhat, type = 'l'); rug(res$x)
abline(h = 1-alpha, lty = 3); abline(v = q, lty = 3)



