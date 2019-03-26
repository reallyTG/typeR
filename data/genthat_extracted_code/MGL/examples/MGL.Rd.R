library(MGL)


### Name: MGL
### Title: Module network inference
### Aliases: MGL

### ** Examples

## Not run: 
##D library(MGL)
##D n = 20 #sample size
##D p = 100 #variable size
##D k = 5 #module size
##D lambda = .01 #penalty parameter to induce sparsity
##D data = matrix(rnorm(n*p), ncol=p)
##D # to start with initial random module latent variables
##D L = matrix(rnorm(n*k), ncol=k)
##D MGL(data, L, lambda)
##D # to start with k-means cluster centroids as module latent variables
##D L = t(kmeans(t(data), k)$centers)
##D MGL(data, L, lambda)
## End(Not run)



