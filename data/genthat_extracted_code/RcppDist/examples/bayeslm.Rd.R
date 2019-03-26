library(RcppDist)


### Name: bayeslm
### Title: bayeslm
### Aliases: bayeslm

### ** Examples

set.seed(123)
n <- 30
x <- cbind(1, matrix(rnorm(n*3), ncol = 3))
beta <- matrix(c(10, 2, -1, 3), nrow = 4)
y <- x %*% beta + rnorm(n)
freqmod <- lm(y ~ x[ , -1])
bayesmod <- bayeslm(y, x)
round(unname(coef(freqmod)), 2)
round(apply(bayesmod$beta_draws, 2, mean), 2)
c(beta)



