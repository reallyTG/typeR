library(grf)


### Name: tune_causal_forest
### Title: Causal forest tuning
### Aliases: tune_causal_forest

### ** Examples

## Not run: 
##D # Find the optimal tuning parameters.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D W = rbinom(n, 1, 0.5)
##D Y = pmax(X[,1], 0) * W + X[,2] + pmin(X[,3], 0) + rnorm(n)
##D params = tune_causal_forest(X, Y, W)$params
##D 
##D # Use these parameters to train a regression forest.
##D tuned.forest = causal_forest(X, Y, W, num.trees = 1000,
##D     min.node.size = as.numeric(params["min.node.size"]),
##D     sample.fraction = as.numeric(params["sample.fraction"]),
##D     mtry = as.numeric(params["mtry"]),
##D     alpha = as.numeric(params["alpha"]),
##D     imbalance.penalty = as.numeric(params["imbalance.penalty"])
## End(Not run)




