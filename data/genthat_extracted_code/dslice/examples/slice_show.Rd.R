library(dslice)


### Name: slice_show
### Title: Show the slicing result
### Aliases: slice_show

### ** Examples

n <- 100
mu <- 0.5
y <- c(rnorm(n, -mu, 1), rnorm(n, mu, 1))
x <- c(rep(0, n), rep(1, n))
x <- x[order(y)]
xdim <- max(x) + 1
lambda <- 1.0
dsres <- ds_k(x, xdim, lambda, slice = TRUE)

ds_show <- slice_show(dsres$slices)



