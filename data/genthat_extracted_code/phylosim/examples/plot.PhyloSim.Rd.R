library(phylosim)


### Name: plot.PhyloSim
### Title: Plot a PhyloSim object
### Aliases: plot.PhyloSim PhyloSim.plot plot,PhyloSim-method

### ** Examples

	# Create a PhyloSim object.
	# Provide the phylo object
	# and the root sequence.
	sim<-PhyloSim(
		name="TinySim",
		phylo=rcoal(3),
		root.seq=NucleotideSequence(string="ATGCTAGCTAGG",processes=list(list(JC69())))
	);
       # plot the aggregated phylo object
       plot(sim)
	# run simulation
	Simulate(sim)
       # Plot the alignment without the tree or ancestral sequences.
       plot(sim, plot.ancestors=FALSE, plot.tree=FALSE)
       # Force a DNA-based color scheme
       # (default is 'auto' to auto-detect based on the sequence composition)
       plot(sim, color.scheme='dna', plot.legend=TRUE)
 


