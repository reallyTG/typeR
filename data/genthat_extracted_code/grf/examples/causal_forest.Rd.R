library(grf)


### Name: causal_forest
### Title: Causal forest
### Aliases: causal_forest

### ** Examples

## Not run: 
##D # Train a causal forest.
##D n = 50; p = 10
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
##D c.forest = causal_forest(X, Y, W, num.trees = 4000)
##D c.pred = predict(c.forest, X.test, estimate.variance = TRUE)
##D 
##D # In some examples, pre-fitting models for Y and W separately may
##D # be helpful (e.g., if different models use different covariates).
##D # In some applications, one may even want to get Y.hat and W.hat
##D # using a completely different method (e.g., boosting).
##D n = 2000; p = 20
##D X = matrix(rnorm(n * p), n, p)
##D TAU = 1 / (1 + exp(-X[, 3]))
##D W = rbinom(n, 1, 1 / (1 + exp(-X[, 1] - X[, 2])))
##D Y = pmax(X[, 2] + X[, 3], 0) + rowMeans(X[, 4:6]) / 2 + W * TAU + rnorm(n)
##D 
##D forest.W = regression_forest(X, W, tune.parameters = TRUE)
##D W.hat = predict(forest.W)$predictions
##D 
##D forest.Y = regression_forest(X, Y, tune.parameters = TRUE)
##D Y.hat = predict(forest.Y)$predictions
##D 
##D forest.Y.varimp = variable_importance(forest.Y)
##D 
##D # Note: Forests may have a hard time when trained on very few variables
##D # (e.g., ncol(X) = 1, 2, or 3). We recommend not being too aggressive
##D # in selection.
##D selected.vars = which(forest.Y.varimp / mean(forest.Y.varimp) > 0.2)
##D 
##D tau.forest = causal_forest(X[,selected.vars], Y, W,
##D                            W.hat = W.hat, Y.hat = Y.hat,
##D                            tune.parameters = TRUE)
##D tau.hat = predict(tau.forest)$predictions
## End(Not run)




