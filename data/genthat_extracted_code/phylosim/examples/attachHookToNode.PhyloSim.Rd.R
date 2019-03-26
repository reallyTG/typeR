library(phylosim)


### Name: attachHookToNode.PhyloSim
### Title: Attach a callback function to a given node of a phylo object
###   aggregated by a PhyloSim object
### Aliases: attachHookToNode.PhyloSim PhyloSim.attachHookToNode
###   attachHookToNode,PhyloSim-method

### ** Examples

	# Create a PhyloSim object.
	# Provide the phylo object
	# and the root sequence.
	sim<-PhyloSim(
		name="TinySim",
		phylo=rcoal(3),
		root.seq=NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	);
	# create a node hook function
	hook<-function(seq=NA){
		# replace the substitution process with F84
		if(inherits(seq,"NucleotideSequence")){
			cat("Replacing JC69 with F84.\n");
			seq$processes<-list(list(F84(rate.params=list("Kappa" = 2))));
		}
		return(seq);
	}
	# attach hook function to node 5
	attachHookToNode(sim,5,hook);
	# Run the simulation
	Simulate(sim);
	# Check if the processes have been truly replaced
	lapply(sim$sequences, getUniqueProcesses.Sequence)
	# Print the resulting alignment
	sim$alignment
 


