library(phytools)


### Name: ltt
### Title: Creates lineage-through-time plot (including extinct lineages)
### Aliases: ltt gtt
### Keywords: phylogenetics plotting diversification analysis

### ** Examples

trees<-pbtree(n=100,scale=100,nsim=10)
obj<-ltt(trees,plot=FALSE)
plot(obj,log="y",log.lineages=FALSE,main="lineage through time plots")
tree<-pbtree(b=1,d=0.25,t=4)
obj<-ltt(tree,gamma=FALSE)
obj



