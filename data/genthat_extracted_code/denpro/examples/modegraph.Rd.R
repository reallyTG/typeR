library(denpro)


### Name: modegraph
### Title: Calculates a mode graph from a scale of estimates
### Aliases: modegraph
### Keywords: multivariate smooth

### ** Examples

dendat<-sim.data(n=200,type="mulmod")

h1<-0.9
h2<-2.2
lkm<-5
hseq<-hgrid(h1,h2,lkm)

N<-c(16,16)
estiseq<-lstseq.kern(dendat,hseq,N,lstree=TRUE)

mt<-modegraph(estiseq)

plotmodet(mt)




