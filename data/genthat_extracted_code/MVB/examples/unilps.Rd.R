library(MVB)


### Name: unilps
### Title: univariate model fitting with lasso penalty
### Aliases: unilps

### ** Examples

n <- 100
p <- 4
x <- matrix(rnorm(n * p, 0, 4), n, p)
eta <- x 
pr <- exp(eta) / (1+ exp(eta))
res <- rbinom(n, 1, pr)
fit <- unilps(res ~ x - 1, family = 'binomial')



