library(phytools)


### Name: countSimmap
### Title: Counts the number of character changes on a SIMMAP style tree or
###   set of trees
### Aliases: countSimmap
### Keywords: phylogenetics utilities

### ** Examples

tree<-pbtree(n=100,scale=1)
Q<-matrix(c(-2,1,1,1,-2,1,1,1,-2),3,3)
colnames(Q)<-rownames(Q)<-c("A","B","C")
mtree<-sim.history(tree,Q)
countSimmap(mtree,states=rownames(Q))



