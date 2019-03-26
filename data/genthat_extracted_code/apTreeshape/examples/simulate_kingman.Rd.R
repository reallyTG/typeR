library(apTreeshape)


### Name: simulate_kingman
### Title: Ranked topology with Kingman's coalescent depths
### Aliases: simulate_kingman

### ** Examples

# Simulate a tree
set.seed(813)
tree=simulate_kingman(epsilon=0.001,alpha=-1,beta=-1,N=20,equal.ab=FALSE,eta=1.5)

# Plot the tree with dots at tips that have sizes scaling with log abundance
tree$tip.label = rep(".", length(tree$tip.label))
plot.phylo(tree, show.node.label=TRUE, 
          cex=(log(tree$tip.ab)-min(log(tree$tip.ab)-0.1))*
          6/diff(range(log(tree$tip.ab))), adj=0.1)



