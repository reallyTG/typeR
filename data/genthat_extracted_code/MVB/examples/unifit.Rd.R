library(MVB)


### Name: unifit
### Title: univariate model fitting
### Aliases: unifit

### ** Examples

n <- 100
p <- 4
x <- matrix(rnorm(n * p, 0, 4), n, p)
eta <- x 
pr <- exp(eta) / (1+ exp(eta))
res <- rbinom(n, 1, pr)
fit <- unifit(res ~ x - 1, family = 'binomial')



