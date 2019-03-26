library(phylosim)


### Name: getAlignment.PhyloSim
### Title: Get the alignment stored in a PhyloSim object
### Aliases: getAlignment.PhyloSim PhyloSim.getAlignment
###   getAlignment,PhyloSim-method

### ** Examples

	# Create a PhyloSim object.
	# Provide the phylo object
	# and the root sequence.
	sim<-PhyloSim(
		name="TinySim",
		phylo=rcoal(3),
		root.seq=NucleotideSequence(string="ATG",processes=list(list(JC69())))
	);
	# run the simulation
	Simulate(sim)
	# get the resulting aligment
	getAlignment(sim)
	# via virtual fileld:
	sim$alignment
 


