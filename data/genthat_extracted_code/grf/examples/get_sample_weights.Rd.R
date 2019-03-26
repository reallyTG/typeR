library(grf)


### Name: get_sample_weights
### Title: Given a trained forest and test data, compute the training
###   sample weights for each test point.
### Aliases: get_sample_weights

### ** Examples

## Not run: 
##D  p = 10
##D  n = 100
##D  X = matrix(2 * runif(n * p) - 1, n, p)
##D  Y = (X[,1] > 0) + 2 * rnorm(n)
##D  rrf = regression_forest(X, Y, mtry=p)
##D  sample.weights.oob = get_sample_weights(rrf)
##D 
##D  n.test = 15
##D  X.test = matrix(2 * runif(n.test * p) - 1, n.test, p)
##D  sample.weights = get_sample_weights(rrf, X.test)
## End(Not run)




