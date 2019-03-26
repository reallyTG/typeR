library(apTreeshape)


### Name: simulate_tree
### Title: Simulates ranked topology
### Aliases: simulate_tree

### ** Examples

# Simulate a tree
set.seed(813)
tree=simulate_tree(epsilon=0.001,alpha=2,beta=-1,N=20,equal.ab=FALSE,eta=0.5)

# Plot the tree with dots at tips that have sizes scaling with log abundance
tree$tip.label = rep(".", length(tree$tip.label))
plot.phylo(tree, show.node.label=TRUE, 
          cex=(log(tree$tip.ab)-min(log(tree$tip.ab)-0.1))*
          6/diff(range(log(tree$tip.ab))), adj=0.1)



