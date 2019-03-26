library(fclust)


### Name: FKM.gkb.ent
### Title: Gustafson, Kessel and Babuska - like fuzzy k-means with entropy
###   regularization
### Aliases: FKM.gkb.ent
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## unemployment data
##D data(unemployment)
##D ## Gustafson, Kessel and Babuska-like fuzzy k-means with entropy regularization,
##D ##fixing the number of clusters
##D clust=FKM.gkb.ent(unemployment,k=3,ent=0.2,RS=10,stand=1)
##D ## Gustafson, Kessel and Babuska-like fuzzy k-means with entropy regularization,
##D ##selecting the number of clusters
##D clust=FKM.gkb.ent(unemployment,k=2:6,ent=0.2,RS=10,stand=1)
## End(Not run)



