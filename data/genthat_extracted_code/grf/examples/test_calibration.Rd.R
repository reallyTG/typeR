library(grf)


### Name: test_calibration
### Title: Omnibus evaluation of the quality of the random forest estimates
###   via calibration.
### Aliases: test_calibration

### ** Examples

## Not run: 
##D n = 800; p = 5
##D X = matrix(rnorm(n*p), n, p)
##D W = rbinom(n, 1, 0.25 + 0.5 * (X[,1] > 0))
##D Y = pmax(X[,1], 0) * W + X[,2] + pmin(X[,3], 0) + rnorm(n)
##D forest = causal_forest(X, Y, W)
##D test_calibration(forest)
## End(Not run)




