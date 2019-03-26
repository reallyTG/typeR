library(KernelKnn)


### Name: KernelKnnCV
### Title: kernel-k-nearest-neighbors using cross-validation
### Aliases: KernelKnnCV

### ** Examples


## Not run: 
##D data(ionosphere)
##D 
##D X = ionosphere[, -c(2, ncol(ionosphere))]
##D y = as.numeric(ionosphere[, ncol(ionosphere)])
##D 
##D out = KernelKnnCV(X, y, k = 5, folds = 3, regression = FALSE, Levels = unique(y))
## End(Not run)



