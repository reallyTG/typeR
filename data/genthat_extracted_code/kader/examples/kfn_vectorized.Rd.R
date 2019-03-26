library(kader)


### Name: kfn_vectorized
### Title: Convolution of Kernel Function K with fn
### Aliases: kfn_vectorized

### ** Examples

require(stats)

set.seed(2017);   n <- 100;   Xdata <- rnorm(n)
x0 <- 1;          sig <- 1;   h <- n^(-1/5)

Ai <- (x0 - Xdata)/h
Bj <- mean(Xdata) - Xdata   # in case of non-robust method
AiBj <- outer(Ai, Bj/sig, "+")

ugrid <- seq(-10, 10, by = 1)
kader:::kfn_vectorized(u = ugrid, K = dnorm, xixj = AiBj, h = h, sig = sig)




