library(psych)


### Name: cluster.fit
### Title: cluster Fit: fit of the cluster model to a correlation matrix
### Aliases: cluster.fit
### Keywords: multivariate cluster

### ** Examples

 r.mat<- Harman74.cor$cov
 iq.clus <- ICLUST(r.mat,nclusters =2)
 fit <- cluster.fit(r.mat,iq.clus$loadings,iq.clus$clusters)
 fit
 




