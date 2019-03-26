library(recluster)


### Name: recluster.boot
### Title: Bootstrap nodes of consensus trees
### Aliases: recluster.boot
### Keywords: cluster

### ** Examples

data(datamod)
tree<-recluster.cons(datamod,tr=10)
boot<-recluster.boot(tree$cons,tr=5,boot=50,datamod)
recluster.plot(tree$cons,boot,direction="downwards")

data(treemod)
tree<-recluster.cons(datamod,treemod, dist="phylosort", tr=10)
boot<-recluster.boot(tree$cons, datamod, treemod,tr=5,boot=50)
recluster.plot(tree$cons,boot,direction="downwards")




