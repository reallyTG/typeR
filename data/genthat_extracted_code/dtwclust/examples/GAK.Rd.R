library(dtwclust)


### Name: GAK
### Title: Fast global alignment kernels
### Aliases: GAK gak

### ** Examples


## Not run: 
##D data(uciCT)
##D 
##D set.seed(832)
##D GAKd <- proxy::dist(zscore(CharTraj), method = "gak",
##D                     pairwise = TRUE, window.size = 18L)
##D 
##D # Obtained estimate of sigma
##D sigma <- attr(GAKd, "sigma")
##D 
##D # Use value for clustering
##D tsclust(CharTraj, k = 20L,
##D         distance = "gak", centroid = "shape",
##D         trace = TRUE,
##D         args = tsclust_args(dist = list(sigma = sigma,
##D                                         window.size = 18L)))
## End(Not run)

# Unnormalized similarities
proxy::simil(CharTraj[1L:5L], method = "ugak")




