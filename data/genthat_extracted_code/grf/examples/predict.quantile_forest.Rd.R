library(grf)


### Name: predict.quantile_forest
### Title: Predict with a quantile forest
### Aliases: predict.quantile_forest

### ** Examples

## Not run: 
##D # Train a quantile forest.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D q.forest = quantile_forest(X, Y, quantiles=c(0.1, 0.5, 0.9))
##D 
##D # Predict on out-of-bag training samples.
##D q.pred = predict(q.forest)
##D 
##D # Predict using the forest.
##D X.test = matrix(0, 101, p)
##D X.test[,1] = seq(-2, 2, length.out = 101)
##D q.pred = predict(q.forest, X.test)
## End(Not run)




