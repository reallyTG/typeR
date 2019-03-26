library(fclust)


### Name: FKM.ent.noise
### Title: Fuzzy k-means with entropy regularization and noise cluster
### Aliases: FKM.ent.noise
### Keywords: multivariate

### ** Examples

## butterfly data
data(butterfly)
## fuzzy k-means with entropy regularization and noise cluster, fixing the number of clusters
clust=FKM.ent.noise(butterfly,k = 2, RS=5,delta=3)
## fuzzy k-means with entropy regularization and noise cluster, selecting the number of clusters
clust=FKM.ent.noise(butterfly,RS=5,delta=3)



