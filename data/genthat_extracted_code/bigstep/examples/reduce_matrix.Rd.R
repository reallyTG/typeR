library(bigstep)


### Name: reduce_matrix
### Title: Reducing number of variables
### Aliases: reduce_matrix

### ** Examples

set.seed(1)
n <- 30
p <- 10
X <- matrix(rnorm(n * p), ncol = p)
y <- X[, 2] + 2*X[, 3] - X[, 6] + rnorm(n)
d <- prepare_data(y, X)
reduce_matrix(d)




