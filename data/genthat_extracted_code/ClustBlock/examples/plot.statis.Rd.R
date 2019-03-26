library(ClustBlock)


### Name: plot.statis
### Title: Displays the STATIS graphs
### Aliases: plot.statis
### Keywords: quantitative

### ** Examples


 data(smoo)
 NameBlocks=paste0("S",1:24)
 st=statis(Data=smoo,Blocks=rep(2,24),NameBlocks = NameBlocks)
 plot(st, axes=c(1,3), Graph_weights=FALSE)




