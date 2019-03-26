library(forestSAS)


### Name: nnoverlap
### Title: Crown overlap among nearest neighbour
### Aliases: nnoverlap

### ** Examples

data(tree.ppp)
NNcrown<-nnIndex(tree.ppp,N=4,smark="crownwid.m",buffer=FALSE)
NNoverlap<-nnoverlap(NNcrown$nncrownwid.m,NNcrown$nndist)
NNoverlap



