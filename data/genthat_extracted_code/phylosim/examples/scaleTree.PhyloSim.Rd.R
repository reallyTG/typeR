library(phylosim)


### Name: scaleTree.PhyloSim
### Title: Scale the branch lengths of a phylo object aggragted by a
###   PhyloSim object
### Aliases: scaleTree.PhyloSim PhyloSim.scaleTree
###   scaleTree,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the tree length
	sim$treeLength
	# scale tree
	scaleTree(sim,10)
	# get the scaled tree length
	sim$treeLength
 


