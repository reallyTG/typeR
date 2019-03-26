library(grf)


### Name: predict.local_linear_forest
### Title: Predict with a local linear forest
### Aliases: predict.local_linear_forest

### ** Examples

## Not run: 
##D # Train the forest.
##D n = 50; p = 5
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D forest = local_linear_forest(X, Y)
##D 
##D # Predict using the forest.
##D X.test = matrix(0, 101, p)
##D X.test[,1] = seq(-2, 2, length.out = 101)
##D predictions = predict(forest, X.test)
##D 
##D # Predict on out-of-bag training samples.
##D predictions.oob = predict(forest)
## End(Not run)




