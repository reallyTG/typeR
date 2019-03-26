library(ssgraph)


### Name: ssgraph-package
### Title: Bayesian Graphical Estimation using Spike-and-Slab Priors
### Aliases: ssgraph-package ' copula_C ' ' copula_S '
### Keywords: Package, ssgraph, Bayesian Structure Learning, Gaussian
###   Graphical Models, Gaussian Copula Graphical Models, Spike and Slab
###   Priors

### ** Examples

## Not run: 
##D 
##D library( ssgraph )
##D 
##D # Generating multivariate normal data from a 'random' graph
##D data.sim <- bdgraph.sim( n = 100, p = 8, size = 10, vis = TRUE )
##D 
##D # Running algorithm based on GGMs
##D ssgraph.obj <- ssgraph( data = data.sim, iter = 5000 )
##D 
##D summary( ssgraph.obj )
##D 
##D # To compare the result with true graph
##D compare( data.sim, ssgraph.obj, main=c("True graph", "ssgraph"), vis=TRUE )
## End(Not run)



