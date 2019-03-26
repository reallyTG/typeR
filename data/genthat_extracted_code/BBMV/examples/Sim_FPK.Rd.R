library(BBMV)


### Name: Sim_FPK
### Title: Simulation of the BBM+V process.
### Aliases: Sim_FPK

### ** Examples

# Simulate data: tree + continuous trait
library(geiger)
tree=sim.bdtree(stop='taxa',n=20) # tree with few tips for quick tests
tree$edge.length=100*tree$edge.length/max(branching.times(tree)) # rescale the tree
# Simulate a trait evolving on the tree with a linear trend towards small values
TRAIT= Sim_FPK(tree,x0=0,V=seq(from=0,to=5,length.out=50),sigma=10,bounds=c(-5, 5)) 



