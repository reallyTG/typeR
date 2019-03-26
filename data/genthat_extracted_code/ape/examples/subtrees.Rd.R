library(ape)


### Name: subtrees
### Title: All subtrees of a Phylogenetic Tree
### Aliases: subtrees
### Keywords: manip

### ** Examples

### Random tree with 12 leaves
phy<-rtree(12)
par(mfrow=c(4,3))
plot(phy, sub="Complete tree")

### Extract the subtrees
l<-subtrees(phy)

### plot all the subtrees
for (i in 1:11) plot(l[[i]], sub=paste("Node", l[[i]]$node.label[1]))
par(mfrow=c(1,1))



