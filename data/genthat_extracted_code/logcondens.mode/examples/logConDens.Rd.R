library(logcondens.mode)


### Name: logConDens
### Title: Compute log-concave density estimator and related quantities
### Aliases: logConDens
### Keywords: htest nonparametric

### ** Examples

## ===================================================
## Illustrate on simulated data
## ===================================================

## Set parameters
n <- 50
x <- rnorm(n)

res <- logConDens(x, smoothed = TRUE, print = FALSE, gam = NULL, 
    xs = NULL)
summary(res)
plot(res, which = "density", legend.pos = "topright")
plot(res, which = "log-density")
plot(res, which = "CDF")

## Compute slopes and intercepts of the linear functions that 
## compose phi
slopes <- diff(res$phi) / diff(res$x)
intercepts <- -slopes * res$x[-n] + res$phi[-n]


## ===================================================
## Illustrate method on reliability data
## Reproduce Fig. 2 in Duembgen & Rufibach (2009)
## ===================================================

## Set parameters
data(reliability)
x <- reliability
n <- length(x)
res <- logConDens(x, smooth = TRUE, print = TRUE)
phi <- res$phi
f <- exp(phi)

## smoothed log-concave PDF
f.smoothed <- res$f.smoothed
xs <- res$xs

## compute kernel density
sig <- sd(x)
h <- sig / sqrt(n)
f.kernel <- rep(NA, length(xs))
for (i in 1:length(xs)){
    xi <- xs[i]
    f.kernel[i] <- mean(dnorm(xi, mean = x, sd = h))
}

## compute normal density
mu <- mean(x)
f.normal <- dnorm(xs, mean = mu, sd = sig)

## ===================================================
## Plot resulting densities, i.e. reproduce Fig. 2
## in Duembgen and Rufibach (2009)
## ===================================================
plot(0, 0, type = 'n', xlim = range(xs), ylim = c(0, 6.5 * 10^-3))
rug(res$x)
lines(res$x, f, col = 2)
lines(xs, f.normal, col = 3)
lines(xs, f.kernel, col = 4)
lines(xs, f.smoothed, lwd = 3, col = 5)
legend("topleft", c("log-concave", "normal", "kernel", 
    "log-concave smoothed"), lty = 1, col = 2:5, bty = "n")


## ===================================================
## Plot log-densities
## ===================================================
plot(0, 0, type = 'n', xlim = range(xs), ylim = c(-20, -5))
legend("bottomright", c("log-concave", "normal", "kernel", 
    "log-concave smoothed"), lty = 1, col = 2:5, bty = "n")
rug(res$x)
lines(res$x, phi, col = 2)
lines(xs, log(f.normal), col = 3)
lines(xs, log(f.kernel), col = 4)
lines(xs, log(f.smoothed), lwd = 3, col = 5)


## ===================================================
## Confidence intervals at a fixed point for the density
## see help file for logConCI()
## ===================================================



