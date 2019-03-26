library(grf)


### Name: get_tree
### Title: Retrieve a single tree from a trained forest object.
### Aliases: get_tree

### ** Examples

## Not run: 
##D # Train a quantile forest.
##D n = 50; p = 10
##D X = matrix(rnorm(n*p), n, p)
##D Y = X[,1] * rnorm(n)
##D q.forest = quantile_forest(X, Y, quantiles=c(0.1, 0.5, 0.9))
##D 
##D # Examine a particular tree.
##D q.tree = get_tree(q.forest, 3)
##D q.tree$nodes
## End(Not run)




