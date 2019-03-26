library(KernelKnn)


### Name: distMat.KernelKnnCV
### Title: cross validated kernel-k-nearest-neighbors using a distance
###   matrix
### Aliases: distMat.KernelKnnCV

### ** Examples


## Not run: 
##D data(ionosphere)
##D 
##D X = ionosphere[, -c(2, ncol(ionosphere))]
##D y = as.numeric(ionosphere[, ncol(ionosphere)])
##D 
##D dist_obj = dist(X)
##D 
##D dist_mat = as.matrix(dist_obj)
##D 
##D out = distMat.KernelKnnCV(dist_mat, y, k = 5, folds = 3, Levels = unique(y))
## End(Not run)



