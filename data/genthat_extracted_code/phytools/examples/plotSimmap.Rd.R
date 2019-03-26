library(phytools)


### Name: plotSimmap
### Title: Plot stochastic character mapped tree
### Aliases: plotSimmap plot.simmap plot.multiSimmap
### Keywords: phylogenetics plotting comparative method

### ** Examples

# simulate a mapped tree
Q<-matrix(c(-2,1,1,1,-2,1,1,1,-2),3,3)
rownames(Q)<-colnames(Q)<-letters[1:3]
tree<-sim.history(pbtree(n=100,scale=1),Q)
cols<-setNames(c("blue","red","green"),letters[1:3])
# plot the mapping
plot(tree,cols,ftype="i",fsize=0.7)



