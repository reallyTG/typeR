library(grf)


### Name: split_frequencies
### Title: Calculate which features the forest split on at each depth.
### Aliases: split_frequencies

### ** Examples

## Not run: 
##D # Train a quantile forest.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D q.forest = quantile_forest(X, Y, quantiles=c(0.1, 0.5, 0.9))
##D 
##D # Calculate the split frequencies for this forest.
##D split_frequencies(q.forest)
## End(Not run)




