library(grf)


### Name: average_partial_effect
### Title: Estimate average partial effects using a causal forest
### Aliases: average_partial_effect

### ** Examples

## Not run: 
##D n = 2000; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D W = rbinom(n, 1, 1/(1 + exp(-X[,2]))) + rnorm(n)
##D Y = pmax(X[,1], 0) * W + X[,2] + pmin(X[,3], 0) + rnorm(n)
##D tau.forest = causal_forest(X, Y, W)
##D tau.hat = predict(tau.forest)
##D average_partial_effect(tau.forest)
##D average_partial_effect(tau.forest, subset = X[,1] > 0)
## End(Not run)




