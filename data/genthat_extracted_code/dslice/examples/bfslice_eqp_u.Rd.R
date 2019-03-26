library(dslice)


### Name: bfslice_eqp_u
### Title: Dependency detection between a level k (k > 1) categorical
###   variable and a continuous variable via Bayes factor with given size
###   of each group.
### Aliases: bfslice_eqp_u

### ** Examples

n <- 1000
mu <- 0.2
y <- c(rnorm(n, -mu, 1), rnorm(n, mu, 1))
x <- c(rep(0, n), rep(1, n))
x <- x[order(y)]
dim <- max(x) + 1
lambda <- 1.0
alpha <- 1.0
bfval <- bfslice_eqp_u(x, dim, lambda, alpha)



