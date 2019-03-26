library(phylosim)


### Name: getRootNode.PhyloSim
### Title: Get the identifier of the root node from a PhyloSim object
### Aliases: getRootNode.PhyloSim PhyloSim.getRootNode
###   getRootNode,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the root node ID
	getRootNode(sim)
	# get the root node ID via virtual field
	sim$rootNode
 


