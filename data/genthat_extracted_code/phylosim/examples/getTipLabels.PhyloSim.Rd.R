library(phylosim)


### Name: getTipLabels.PhyloSim
### Title: Get the tip labels from a phylo object aggregated by a PhyloSim
###   object
### Aliases: getTipLabels.PhyloSim PhyloSim.getTipLabels
###   getTipLabels,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the tip labels
	getTipLabels(sim)
	# get the tip lables via virtual field
	sim$tipLabels
 


