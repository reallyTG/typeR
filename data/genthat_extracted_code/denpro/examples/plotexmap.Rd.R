library(denpro)


### Name: plotexmap
### Title: Plots a scale of excess mass profiles
### Aliases: plotexmap
### Keywords: multivariate smooth hplot

### ** Examples

dendat<-sim.data(n=200,type="mulmod")

h1<-0.9
h2<-2.2
lkm<-5
hseq<-hgrid(h1,h2,lkm)

N<-c(16,16)
estiseq<-lstseq.kern(dendat,hseq,N,lstree=TRUE)

mt<-modegraph(estiseq)

horilines<-c(1,2,3,4)

sp<-exmap(estiseq,mt,horilines)

plotexmap(sp,mt,ylim=c(1,4.5))




