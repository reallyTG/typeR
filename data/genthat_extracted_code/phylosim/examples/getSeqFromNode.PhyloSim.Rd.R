library(phylosim)


### Name: getSeqFromNode.PhyloSim
### Title: Get the Sequence object associated with a given node of a phylo
###   object aggregated by a PhyloSim object
### Aliases: getSeqFromNode.PhyloSim PhyloSim.getSeqFromNode
###   getSeqFromNode,PhyloSim-method

### ** Examples

	# Create a PhyloSim object.
	# Provide the phylo object
	# and the root sequence.
	sim<-PhyloSim(
		name="TinySim",
		phylo=rcoal(3),
		root.seq=NucleotideSequence(string="ATG",processes=list(list(JC69())))
	);
	# get the sequence associated with node 5
	getSeqFromNode(sim,5)	# Should be NA
	# Run the simulation
	Simulate(sim)
	# try again
	getSeqFromNode(sim,5)
 


