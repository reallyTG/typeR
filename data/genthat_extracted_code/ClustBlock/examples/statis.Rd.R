library(ClustBlock)


### Name: statis
### Title: Performs the STATIS method on different blocks of quantitative
###   variables
### Aliases: statis
### Keywords: quantitative

### ** Examples


 data(smoo)
 NameBlocks=paste0("S",1:24)
 st=statis(Data=smoo, Blocks=rep(2,24),NameBlocks = NameBlocks)
 #with variables scaling
 st2=statis(Data=smoo, Blocks=rep(2,24),NameBlocks = NameBlocks, Graph_weights=FALSE, scale=TRUE)




