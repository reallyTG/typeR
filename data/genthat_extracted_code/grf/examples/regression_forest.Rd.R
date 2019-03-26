library(grf)


### Name: regression_forest
### Title: Regression forest
### Aliases: regression_forest

### ** Examples

## Not run: 
##D # Train a standard regression forest.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D r.forest = regression_forest(X, Y)
##D 
##D # Predict using the forest.
##D X.test = matrix(0, 101, p)
##D X.test[,1] = seq(-2, 2, length.out = 101)
##D r.pred = predict(r.forest, X.test)
##D 
##D # Predict on out-of-bag training samples.
##D r.pred = predict(r.forest)
##D 
##D # Predict with confidence intervals; growing more trees is now recommended.
##D r.forest = regression_forest(X, Y, num.trees = 100)
##D r.pred = predict(r.forest, X.test, estimate.variance = TRUE)
## End(Not run)




