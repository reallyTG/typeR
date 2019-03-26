library(grf)


### Name: tune_regression_forest
### Title: Regression forest tuning
### Aliases: tune_regression_forest

### ** Examples

## Not run: 
##D # Find the optimal tuning parameters.
##D n = 500; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D params = tune_regression_forest(X, Y)$params
##D 
##D # Use these parameters to train a regression forest.
##D tuned.forest = regression_forest(X, Y, num.trees = 1000,
##D     min.node.size = as.numeric(params["min.node.size"]),
##D     sample.fraction = as.numeric(params["sample.fraction"]),
##D     mtry = as.numeric(params["mtry"]),
##D     alpha = as.numeric(params["alpha"]),
##D     imbalance.penalty = as.numeric(params["imbalance.penalty"]))
## End(Not run)




