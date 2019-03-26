library(denpro)


### Name: branchmap
### Title: Computes a branching map from a sequence of level set trees
### Aliases: branchmap
### Keywords: smooth multivariate

### ** Examples

dendat<-sim.data(n=200,type="mulmod")

h1<-0.9
h2<-2.2
lkm<-5
hseq<-hgrid(h1,h2,lkm)

N<-c(16,16)
estiseq<-lstseq.kern(dendat,hseq,N,lstree=TRUE)

bm<-branchmap(estiseq)

plotbranchmap(bm)




