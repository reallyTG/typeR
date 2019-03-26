library(phylosim)


### Name: getNtips.PhyloSim
### Title: Get the number of the tips form a phylo object aggregated by a
###   PhyloSim object
### Aliases: getNtips.PhyloSim PhyloSim.getNtips getNtips,PhyloSim-method

### ** Examples

	# create a PhyloSim object
	sim<-PhyloSim(phylo=rcoal(5));
	# get the number of tips
	getNtips(sim)
	# get the number of tips via virtual field
	sim$ntips
 


