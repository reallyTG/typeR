library(dslice)


### Name: bfslice_u
### Title: Dependency detection between a level k (k > 1) categorical
###   variable and a continuous variable via Bayes factor.
### Aliases: bfslice_u

### ** Examples

n <- 100
mu <- 0.5
y <- c(rnorm(n, -mu, 1), rnorm(n, mu, 1))
x <- c(rep(0, n), rep(1, n))
x <- x[order(y)]
dim <- max(x) + 1
lambda <- 1.0
alpha <- 1.0
bfval <- bfslice_u(x, dim, lambda, alpha)



