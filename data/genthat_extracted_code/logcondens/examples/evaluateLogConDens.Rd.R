library(logcondens)


### Name: evaluateLogConDens
### Title: Evaluates the Log-Density MLE and Smoothed Estimator at
###   Arbitrary Real Numbers xs
### Aliases: evaluateLogConDens
### Keywords: htest nonparametric

### ** Examples

## estimate gamma density
set.seed(1977)
x <- rgamma(200, 2, 1)
res <- logConDens(x, smoothed = TRUE, print = FALSE)

## compute function values at an arbitrary point
xs <- (res$x[100] + res$x[101]) / 2
evaluateLogConDens(xs, res)

## only compute function values for non-smooth estimates
evaluateLogConDens(xs, res, which = 1:3)



