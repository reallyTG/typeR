library(ClustBlock)


### Name: clustatis_kmeans
### Title: Compute the CLUSTATIS partitionning algorithm on different
###   blocks of quantitative variables. Can be performed using a multi
###   start strategy or initial partition provided by the user
### Aliases: clustatis_kmeans
### Keywords: quantitative

### ** Examples


 data(smoo)
 NameBlocks=paste0("S",1:24)
 #with multi-start
 cl_km=clustatis_kmeans(Data=smoo,Blocks=rep(2,24),NameBlocks = NameBlocks, clust=3)
 #with an initial partition
 cl=clustatis(Data=smoo,Blocks=rep(2,24),NameBlocks = NameBlocks,
 Graph_dend=FALSE)
 partition=cl$cutree_k$partition3
 cl_km2=clustatis_kmeans(Data=smoo,Blocks=rep(2,24),NameBlocks = NameBlocks,
 clust=partition, Graph_weights=FALSE, Graph_groups=FALSE)




