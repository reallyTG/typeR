library(phylosim)


### Name: summary.PhyloSim
### Title: Summarize the properties of an object
### Aliases: summary.PhyloSim PhyloSim.summary summary,PhyloSim-method

### ** Examples

	# Create a PhyloSim object.
	# Provide the phylo object
	# and the root sequence.
	sim<-PhyloSim(
		name="TinySim",
		phylo=rcoal(3),
		root.seq=NucleotideSequence(string="ATG",processes=list(list(JC69())))
	);
       # get a summary
       summary(sim)
 


