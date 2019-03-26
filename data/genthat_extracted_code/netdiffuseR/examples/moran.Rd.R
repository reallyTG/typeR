library(netdiffuseR)


### Name: moran
### Title: Computes Moran's I correlation index
### Aliases: moran

### ** Examples


## Not run: 
##D 
##D   # Generating a small random graph
##D   set.seed(123)
##D   graph <- rgraph_ba(t = 4)
##D   w <- approx_geodesic(graph)
##D   x <- rnorm(5)
##D 
##D   # Computing Moran's I
##D   moran(x, w)
##D 
##D   # Comparing with the ape's package version
##D   ape::Moran.I(x, as.matrix(w))
##D 
## End(Not run)




