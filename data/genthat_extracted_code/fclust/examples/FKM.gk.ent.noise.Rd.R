library(fclust)


### Name: FKM.gk.ent.noise
### Title: Gustafson and Kessel - like fuzzy k-means with entropy
###   regularization and noise cluster
### Aliases: FKM.gk.ent.noise
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## unemployment data
##D data(unemployment)
##D ## Gustafson and Kessel-like fuzzy k-means with entropy regularization and noise cluster,
##D ##fixing the number of clusters
##D clust=FKM.gk.ent.noise(unemployment,k=3,ent=0.2,delta=1,RS=10,stand=1)
##D ## Gustafson and Kessel-like fuzzy k-means with entropy regularization and noise cluster,
##D ##selecting the number of clusters
##D clust=FKM.gk.ent.noise(unemployment,k=2:6,ent=0.2,delta=1,RS=10,stand=1)
## End(Not run)



