library(clValid)


### Name: stability
### Title: Stability Measures
### Aliases: stability APN AD ADM FOM
### Keywords: cluster

### ** Examples


data(mouse)
express <- mouse[1:25,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID[1:25]
## hierarchical clustering
Dist <- dist(express,method="euclidean")
clusterObj <- hclust(Dist, method="average")
nc <- 4 ## number of clusters      
cluster <- cutree(clusterObj,nc)

stab <- matrix(0,nrow=ncol(express),ncol=4)
colnames(stab) <- c("APN","AD","ADM","FOM")

## Need loop over all removed samples
for (del in 1:ncol(express)) {
  matDel <- express[,-del]               
  DistDel <- dist(matDel,method="euclidean")
  clusterObjDel <- hclust(DistDel, method="average")
  clusterDel <- cutree(clusterObjDel,nc)
  stab[del,] <- stability(express, Dist, del, cluster, clusterDel)
}
colMeans(stab)




