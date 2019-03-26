library(grf)


### Name: quantile_forest
### Title: Quantile forest
### Aliases: quantile_forest

### ** Examples

## Not run: 
##D # Generate data.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D X.test = matrix(0, 101, p)
##D X.test[,1] = seq(-2, 2, length.out = 101)
##D Y = X[,1] * rnorm(n)
##D 
##D # Train a quantile forest.
##D q.forest = quantile_forest(X, Y, quantiles=c(0.1, 0.5, 0.9))
##D 
##D # Make predictions.
##D q.hat = predict(q.forest, X.test)
##D 
##D # Make predictions for different quantiles than those used in training.
##D q.hat = predict(q.forest, X.test, quantiles=c(0.1, 0.9))
##D 
##D # Train a quantile forest using regression splitting instead of quantile-based
##D # splits, emulating the approach in Meinshausen (2006).
##D meins.forest = quantile_forest(X, Y, regression.splitting=TRUE)
##D 
##D # Make predictions for the desired quantiles.
##D q.hat = predict(meins.forest, X.test, quantiles=c(0.1, 0.5, 0.9))
## End(Not run)




