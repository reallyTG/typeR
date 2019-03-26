library(grf)


### Name: predict.custom_forest
### Title: Predict with a custom forest.
### Aliases: predict.custom_forest

### ** Examples

## Not run: 
##D # Train a custom forest.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D c.forest = custom_forest(X, Y)
##D 
##D # Predict using the forest.
##D X.test = matrix(0, 101, p)
##D X.test[,1] = seq(-2, 2, length.out = 101)
##D c.pred = predict(c.forest, X.test)
## End(Not run)




