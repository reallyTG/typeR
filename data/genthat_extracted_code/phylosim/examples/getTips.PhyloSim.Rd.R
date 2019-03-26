library(phylosim)


### Name: getTips.PhyloSim
### Title: Get the node identifiers of the tip nodes from a PhyloSim object
### Aliases: getTips.PhyloSim PhyloSim.getTips getTips,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the tip IDs
	getTips(sim)
	# get the tip IDs via virtual field
	sim$tips
 


