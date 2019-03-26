library(ncg)


### Name: ncg
### Title: Computes the noncentral gamma functions: pdf, cdf, quantiles and
###   noncentrality parameter.
### Aliases: ncg-package
### Keywords: ncg-package

### ** Examples

library(ncg)
x <- c(2, 3, 2)
alpha <- c(1.5, 1.1, 0.8) 
delta <- 2
pgammanc(x, alpha, delta)
dgammanc(x, alpha, delta)
p <- 0.30
delta <- deltagammanc(x, alpha, p)
delta
p <- c(0.80, 0.98, 0.24)
delta <- 0.2
qgammanc(p, alpha, delta)



