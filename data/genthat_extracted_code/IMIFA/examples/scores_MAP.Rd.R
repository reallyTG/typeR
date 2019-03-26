library(IMIFA)


### Name: scores_MAP
### Title: Decompose factor scores by cluster
### Aliases: scores_MAP
### Keywords: utility

### ** Examples

## Not run: 
##D data(coffee)
##D sim <- mcmc_IMIFA(coffee, n.iters=1000)
##D res <- get_IMIFA_results(sim)
##D 
##D # Examine the single posterior mean scores matrix
##D res$Scores$post.eta
##D 
##D # Decompose into G matrices, common numbers of columns
##D eta <- scores_MAP(res)
##D eta$post.eta
##D 
##D # Allow the number of columns be cluster-specific
##D scores_MAP(res, dropQ=TRUE)$post.eta
## End(Not run)



