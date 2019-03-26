library(recluster)


### Name: recluster.cons
### Title: Consensus tree among re-sampled trees
### Aliases: recluster.cons
### Keywords: cluster

### ** Examples

#Faunistic beta diversity
data(datamod,treemod)
tree<-recluster.cons(datamod,tr=10)
plot(tree$cons,direction="downwards")

#Phylogenetic beta diversity
tree_p<-recluster.cons(datamod,treemod,dist="phylosort",tr=10)
plot(tree_p$cons, direction="downwards")



