library(fclust)


### Name: FKM.gk.ent
### Title: Gustafson and Kessel - like fuzzy k-means with entropy
###   regularization
### Aliases: FKM.gk.ent
### Keywords: multivariate

### ** Examples

## unemployment data
data(unemployment)
## Gustafson and Kessel-like fuzzy k-means with entropy regularization, 
##fixing the number of clusters
clust=FKM.gk.ent(unemployment,k=3,ent=0.2,RS=10,stand=1)
## Not run: 
##D ## Gustafson and Kessel-like fuzzy k-means with entropy regularization,
##D ##selecting the number of clusters
##D clust=FKM.gk.ent(unemployment,k=2:6,ent=0.2,RS=10,stand=1)
## End(Not run)



