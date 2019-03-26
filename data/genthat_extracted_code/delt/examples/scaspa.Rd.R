library(delt)


### Name: scaspa
### Title: Finds the number of modes of histograms which are obtained by
###   pruning an overfitting histogram
### Aliases: scaspa
### Keywords: smooth

### ** Examples

set.seed(1)
dendat<-matrix(rnorm(20),10)  
minlkm<-2
et<-densplit(dendat,minlkm)
treeseq<-prune(et)
treeseq$leafs

scaspa(treeseq,1,5)




