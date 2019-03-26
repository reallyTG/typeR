library(dslice)


### Name: bfslice_c
### Title: Dependency and conditional dependency detection between a level
###   k (k > 1) categorical variable and a continuous variable via Bayes
###   factor.
### Aliases: bfslice_c

### ** Examples

n <- 100
mu <- 0.5

## Unconditional test
y <- c(rnorm(n, -mu, 1), rnorm(n, mu, 1))
x <- c(rep(0, n), rep(1, n))
z <- rep(0, 2*n)

## Conditional test
y <- c(rnorm(n, -mu, 1), rnorm(n, mu, 1))
x <- c(rep(0, n/5), rep(1, n), rep(0, 4*n/5))
z <- c(rep(0, n), rep(1, n))
z <- z[order(y)]

x <- x[order(y)]
zdim <- max(z) + 1
xdim <- max(x) + 1
lambda <- 1.0
alpha <- 1.0
bfval <- bfslice_c(z, x, zdim, xdim, lambda, alpha)



