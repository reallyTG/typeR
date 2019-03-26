library(grf)


### Name: variable_importance
### Title: Calculate a simple measure of 'importance' for each feature.
### Aliases: variable_importance

### ** Examples

## Not run: 
##D # Train a quantile forest.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D q.forest = quantile_forest(X, Y, quantiles=c(0.1, 0.5, 0.9))
##D 
##D # Calculate the 'importance' of each feature.
##D variable_importance(q.forest)
## End(Not run)




