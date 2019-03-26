library(clValid)


### Name: connectivity
### Title: Connectivity Measure
### Aliases: connectivity
### Keywords: cluster

### ** Examples

data(mouse)
express <- mouse[1:25,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID[1:25]
## hierarchical clustering
Dist <- dist(express,method="euclidean")
clusterObj <- hclust(Dist, method="average")
nc <- 2 ## number of clusters      
cluster <- cutree(clusterObj,nc)
connectivity(Dist, cluster)



