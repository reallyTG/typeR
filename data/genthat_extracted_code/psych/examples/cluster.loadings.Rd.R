library(psych)


### Name: cluster.loadings
### Title: Find item by cluster correlations, corrected for overlap and
###   reliability
### Aliases: cluster.loadings
### Keywords: multivariate cluster

### ** Examples


 r.mat<- Harman74.cor$cov
 clusters <- matrix(c(1,1,1,rep(0,24),1,1,1,1,rep(0,17)),ncol=2)
 cluster.loadings(clusters,r.mat)

 




