library(phylosim)


### Name: Simulate.PhyloSim
### Title: Run a simulation according to a PhyloSim object
### Aliases: Simulate.PhyloSim PhyloSim.Simulate Simulate,PhyloSim-method

### ** Examples

	# Create a PhyloSim object.
	# Provide the phylo object
	# and the root sequence.
	sim<-PhyloSim(
		name="TinySim",
		phylo=rcoal(3),
		root.seq=NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	);
	# Run the simulation
	Simulate(sim);
	# Print the resulting sequences
	sim$sequences
	# Print the resulting alignment
	sim$alignment
 


