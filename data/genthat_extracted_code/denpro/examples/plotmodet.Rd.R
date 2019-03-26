library(denpro)


### Name: plotmodet
### Title: Plots a mode graph
### Aliases: plotmodet
### Keywords: multivariate hplot

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

plotmodet(mt,coordi=2)




