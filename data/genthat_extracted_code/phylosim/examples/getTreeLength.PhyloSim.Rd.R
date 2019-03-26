library(phylosim)


### Name: getTreeLength.PhyloSim
### Title: Get the tree length from a PhyloSim object
### Aliases: getTreeLength.PhyloSim PhyloSim.getTreeLength
###   getTreeLength,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the tree length
	getTreeLength(sim)
	# get tree length via virtual field
	sim$treeLength
 


