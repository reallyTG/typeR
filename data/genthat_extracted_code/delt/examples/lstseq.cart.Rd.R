library(delt)


### Name: lstseq.cart
### Title: Calculates a scale of CART histograms
### Aliases: lstseq.cart
### Keywords: smooth multivariate

### ** Examples

library(denpro)
dendat<-sim.data(n=100,seed=1,type="mulmodII")
et<-densplit(dendat)
treeseq<-prune(et)

estiseq<-lstseq.cart(treeseq,maxleaf=20,lstree=TRUE)

mt<-modegraph(estiseq)

plotmodet(mt)

#scaletable(estiseq)




