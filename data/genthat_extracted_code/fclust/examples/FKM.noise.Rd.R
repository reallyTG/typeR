library(fclust)


### Name: FKM.noise
### Title: Fuzzy k-means with noise cluster
### Aliases: FKM.noise
### Keywords: multivariate

### ** Examples

## butterfly data
data(butterfly)
## fuzzy k-means with noise cluster, fixing the number of clusters
clust=FKM.noise(butterfly, k = 2, RS=5,delta=3)
## fuzzy k-means with noise cluster, selecting the number of clusters
clust=FKM.noise(butterfly,RS=5,delta=3)



