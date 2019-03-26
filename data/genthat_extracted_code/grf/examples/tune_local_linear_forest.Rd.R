library(grf)


### Name: tune_local_linear_forest
### Title: Local linear forest tuning
### Aliases: tune_local_linear_forest

### ** Examples

## Not run: 
##D # Find the optimal tuning parameters.
##D n = 500; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D forest = regression_forest(X,Y)
##D tuned.lambda = tune_local_linear_forest(forest)
##D 
##D # Use this parameter to predict from a local linear forest.
##D predictions = predict(forest, linear.correction.variables = 1:p, lambda = tuned.lambda)
## End(Not run)




