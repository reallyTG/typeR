library(fclust)


### Name: FKM.gkb.noise
### Title: Gustafson, Kessel and Babuska - like fuzzy k-means with noise
###   cluster
### Aliases: FKM.gkb.noise
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## unemployment data
##D data(unemployment)
##D ## Gustafson, Kessel and Babuska-like fuzzy k-means with noise cluster,
##D ##fixing the number of clusters
##D clust=FKM.gkb.noise(unemployment,k=3,delta=20,RS=10)
##D ## Gustafson, Kessel and Babuska-like fuzzy k-means with noise cluster,
##D ##selecting the number of clusters
##D clust=FKM.gkb.noise(unemployment,k=2:6,delta=20,RS=10)
## End(Not run)



