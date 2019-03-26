library(ClustBlock)


### Name: plot.clustatis
### Title: Displays the CLUSTATIS graphs
### Aliases: plot.clustatis
### Keywords: quantitative

### ** Examples


 data(smoo)
 NameBlocks=paste0("S",1:24)
 cl=clustatis(Data=smoo,Blocks=rep(2,24),NameBlocks = NameBlocks)
 plot(cl, ngroups=3, Graph_dend=FALSE)
 plot(cl, ngroups=3,  Graph_dend=FALSE, axes=c(1,3))




