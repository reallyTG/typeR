library(fpc)


### Name: cluster.stats
### Title: Cluster validation statistics
### Aliases: cluster.stats
### Keywords: cluster multivariate

### ** Examples
  
  set.seed(20000)
  options(digits=3)
  face <- rFace(200,dMoNo=2,dNoEy=0,p=2)
  dface <- dist(face)
  complete3 <- cutree(hclust(dface),3)
  cluster.stats(dface,complete3,
                alt.clustering=as.integer(attr(face,"grouping")))
  



