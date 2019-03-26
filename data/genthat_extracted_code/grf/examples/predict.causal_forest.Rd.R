library(grf)


### Name: predict.causal_forest
### Title: Predict with a causal forest
### Aliases: predict.causal_forest

### ** Examples

## Not run: 
##D # Train a causal forest.
##D n = 100; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D W = rbinom(n, 1, 0.5)
##D Y = pmax(X[,1], 0) * W + X[,2] + pmin(X[,3], 0) + rnorm(n)
##D c.forest = causal_forest(X, Y, W)
##D 
##D # Predict using the forest.
##D X.test = matrix(0, 101, p)
##D X.test[,1] = seq(-2, 2, length.out = 101)
##D c.pred = predict(c.forest, X.test)
##D 
##D # Predict on out-of-bag training samples.
##D c.pred = predict(c.forest)
##D 
##D # Predict with confidence intervals; growing more trees is now recommended.
##D c.forest = causal_forest(X, Y, W, num.trees = 500)
##D c.pred = predict(c.forest, X.test, estimate.variance = TRUE)
## End(Not run)




