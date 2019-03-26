library(ClustBlock)


### Name: clustatis
### Title: Perform a cluster analysis of blocks of quantitative variables
### Aliases: clustatis
### Keywords: quantitative

### ** Examples


 data(smoo)
 NameBlocks=paste0("S",1:24)
 cl=clustatis(Data=smoo,Blocks=rep(2,24),NameBlocks = NameBlocks)
 plot(cl, ngroups=3, Graph_dend=FALSE)
 summary(cl)
 #with noise cluster
 cl2=clustatis(Data=smoo,Blocks=rep(2,24),NameBlocks = NameBlocks,
 Noise_cluster=TRUE, Graph_dend=FALSE, Graph_bar=FALSE)




