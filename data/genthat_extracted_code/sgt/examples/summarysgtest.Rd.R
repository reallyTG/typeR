library(sgt)


### Name: summary.sgtest
### Title: Summary the Maximum-Likelihood Estimation with the Skewed
###   Generalized T Distribution
### Aliases: summary.sgtest coef.summary.sgtest
### Keywords: models

### ** Examples

# SINGLE VARIABLE ESTIMATION:
### generate random variable
set.seed(7900)
n = 1000
x = rsgt(n, mu = 2, sigma = 2, lambda = -0.25, p = 1.7, q = 7)

### Get starting values and estimate the parameter values
start = list(mu = 0, sigma = 1, lambda = 0, p = 2, q = 10)
result = sgt.mle(X.f = ~ x, start = start, method = "nlminb")
print(result)
print(summary(result))



