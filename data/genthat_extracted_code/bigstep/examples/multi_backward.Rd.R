library(bigstep)


### Name: multi_backward
### Title: Multi-backward step
### Aliases: multi_backward

### ** Examples

set.seed(1)
n <- 30
p <- 10
X <- matrix(rnorm(n * p), ncol = p)
y <- X[, 2] + 2*X[, 3] - X[, 6] + rnorm(n)
d <- prepare_data(y, X)
d %>%
  fast_forward(crit = aic) %>%
  multi_backward(crit = bic)




