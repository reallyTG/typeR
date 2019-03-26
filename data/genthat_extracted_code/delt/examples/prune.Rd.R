library(delt)


### Name: prune
### Title: Prepares for pruning an overfitting evaluation tree
### Aliases: prune
### Keywords: smooth multivariate

### ** Examples

library(denpro)
dendat<-sim.data(n=100,seed=5,type="mulmodII")
et<-densplit(dendat)

treeseq<-prune(et)
treeseq$leafs
len<-length(treeseq$leafs)

leaf<-treeseq$leafs[len-10]
leaf
etsub<-eval.pick(treeseq,leaf=leaf)

dp<-draw.pcf(etsub)
#persp(dp$x,dp$y,dp$z,phi=25,theta=-120)




