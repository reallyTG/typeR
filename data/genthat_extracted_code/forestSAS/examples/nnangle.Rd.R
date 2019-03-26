library(forestSAS)


### Name: nnangle
### Title: Identify the angle among nearest neighbours
### Aliases: nnangle

### ** Examples

data(tree.ppp)
NNcoord<-nnIndex(tree.ppp,N=4,smark=c("x","y"),buffer=FALSE)
NNangle<-nnangle(NNcoord$nndist,NNcoord$nnx,NNcoord$nny)
NNangle



