library(RcppNumerical)


### Name: fastLR
### Title: Fast Logistic Regression Fitting Using L-BFGS Algorithm
### Aliases: fastLR
### Keywords: models regression

### ** Examples

set.seed(123)
n = 1000
p = 100
x = matrix(rnorm(n * p), n)
beta = runif(p)
xb = c(x %*% beta)
p = 1 / (1 + exp(-xb))
y = rbinom(n, 1, p)

system.time(res1 <- glm.fit(x, y, family = binomial()))
system.time(res2 <- fastLR(x, y))
max(abs(res1$coefficients - res2$coefficients))



