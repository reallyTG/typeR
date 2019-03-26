library(fclust)


### Name: FKM.gk.noise
### Title: Gustafson and Kessel - like fuzzy k-means with noise cluster
### Aliases: FKM.gk.noise
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## unemployment data
##D data(unemployment)
##D ## Gustafson and Kessel-like fuzzy k-means with noise cluster, fixing the number of clusters
##D clust=FKM.gk.noise(unemployment,k=3,delta=20,RS=10)
##D ## Gustafson and Kessel-like fuzzy k-means with noise cluster, selecting the number of clusters
##D clust=FKM.gk.noise(unemployment,k=2:6,delta=20,RS=10)
## End(Not run)



