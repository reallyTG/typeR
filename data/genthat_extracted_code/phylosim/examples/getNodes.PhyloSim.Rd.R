library(phylosim)


### Name: getNodes.PhyloSim
### Title: Get the node identifiers from a PhyloSim object
### Aliases: getNodes.PhyloSim PhyloSim.getNodes getNodes,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the node IDs
	getNodes(sim)
	# get the node IDs via virtual field
	sim$nodes
 


