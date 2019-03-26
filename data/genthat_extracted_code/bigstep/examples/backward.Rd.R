library(bigstep)


### Name: backward
### Title: Backward step
### Aliases: backward

### ** Examples

set.seed(1)
n <- 30
p <- 10
X <- matrix(rnorm(n * p), ncol = p)
y <- X[, 2] + 2*X[, 3] - X[, 6] + rnorm(n)
d <- prepare_data(y, X)
d %>%
  fast_forward(crit = aic) %>%
  backward() %>%
  backward()




