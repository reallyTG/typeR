library(delt)


### Name: lstseq.greedy
### Title: Calculates a scale of greedy histograms
### Aliases: lstseq.greedy
### Keywords: smooth multivariate

### ** Examples

library(denpro)
dendat<-sim.data(n=100,seed=1,type="mulmodII")
estiseq<-lstseq.greedy(dendat,maxleaf=20,lstree=TRUE)

mt<-modegraph(estiseq)

plotmodet(mt)

#scaletable(estiseq)




