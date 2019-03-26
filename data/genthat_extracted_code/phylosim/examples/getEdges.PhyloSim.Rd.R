library(phylosim)


### Name: getEdges.PhyloSim
### Title: Get the edge matrix from a phylo object aggregated by a PhyloSim
###   object
### Aliases: getEdges.PhyloSim PhyloSim.getEdges getEdges,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the edge matrix
	getEdges(sim)
	# get the edge matrix via virtual field
	sim$edges
 


