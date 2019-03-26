library(phylosim)


### Name: getSequences.PhyloSim
### Title: Gets all the Sequence objects associated with the nodes of a
###   phylo object aggregated by a PhyloSim object
### Aliases: getSequences.PhyloSim PhyloSim.getSequences
###   getSequences,PhyloSim-method

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
	# get all the associated sequence objects
	getSequences(sim)
	# get the sequence associated with node 3
	# via virtual field
	sim$sequences[[3]]
 


