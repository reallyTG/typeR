library(IsoplotR)


### Name: mds
### Title: Multidimensional Scaling
### Aliases: mds mds.default mds.detritals

### ** Examples

data(examples)
mds(examples$DZ,nnlines=TRUE,pch=21,cex=5)
dev.new()
mds(examples$DZ,shepard=TRUE)



