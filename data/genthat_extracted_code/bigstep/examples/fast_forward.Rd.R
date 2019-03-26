library(bigstep)


### Name: fast_forward
### Title: Fast-forward step
### Aliases: fast_forward

### ** Examples

set.seed(1)
n <- 30
p <- 10
X <- matrix(rnorm(n * p), ncol = p)
y <- X[, 2] + 2*X[, 3] - X[, 6] + rnorm(n)
d <- prepare_data(y, X)
fast_forward(d)



