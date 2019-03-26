library(fclust)


### Name: FKM.med.noise
### Title: Fuzzy k-medoids with noise cluster
### Aliases: FKM.med.noise
### Keywords: multivariate

### ** Examples

## butterfly data
data(butterfly)
## fuzzy k-medoids with noise cluster, fixing the number of clusters
clust=FKM.med.noise(butterfly,k=2,RS=5,delta=3)
## fuzzy k-medoids with noise cluster, selecting the number of clusters
clust=FKM.med.noise(butterfly,RS=5,delta=3)



