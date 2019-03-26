library(dslice)


### Name: ds_eqp_k
### Title: Dependency detection between level k (k > 1) categorical
###   variable and continuous variable
### Aliases: ds_eqp_k

### ** Examples

n <- 100
mu <- 0.5
y <- c(rnorm(n, -mu, 1), rnorm(n, mu, 1))
x <- c(rep("1", n), rep("2", n))
x <- relabel(x)
x <- x[order(y)]
xdim <- max(x) + 1
lambda <- 1.0
dsres <- ds_eqp_k(x, xdim, lambda, slice = TRUE)	



