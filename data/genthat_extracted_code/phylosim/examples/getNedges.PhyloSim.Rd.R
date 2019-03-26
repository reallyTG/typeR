library(phylosim)


### Name: getNedges.PhyloSim
### Title: Get the number of edges from phylo object aggregated by a
###   PhyloSim object
### Aliases: getNedges.PhyloSim PhyloSim.getNedges
###   getNedges,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the number of the edges
	getNedges(sim)
	# get the number of the edges via virtual field
	sim$nedges
 


