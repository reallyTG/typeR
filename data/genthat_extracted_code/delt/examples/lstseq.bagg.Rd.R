library(delt)


### Name: lstseq.bagg
### Title: Calculates a scale of bootstrap aggregated histograms
### Aliases: lstseq.bagg
### Keywords: smooth multivariate

### ** Examples

library(denpro)
dendat<-sim.data(n=100,seed=1,type="mulmodII")

seed<-1        # seed for choosing bootstrap samples
sample="worpl" # without-replacement bootstrap
prune="on"     # we use CART-histograms
B<-2           # the number of histograms in the average

estiseq<-lstseq.bagg(dendat,B,maxleaf=10,lstree=TRUE,
         seed=seed,sample=sample,prune=prune)

mt<-modegraph(estiseq)

plotmodet(mt)

#scaletable(estiseq)




