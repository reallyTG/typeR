library(bigstep)


### Name: stepwise
### Title: Stepwise
### Aliases: stepwise

### ** Examples

set.seed(1)
n <- 30
p <- 10
X <- matrix(rnorm(n * p), ncol = p)
y <- X[, 2] + 2*X[, 3] - X[, 6] + rnorm(n)
d <- prepare_data(y, X)
stepwise(d)
d %>%
  fast_forward(crit = aic) %>%
  stepwise(crit = bic)




