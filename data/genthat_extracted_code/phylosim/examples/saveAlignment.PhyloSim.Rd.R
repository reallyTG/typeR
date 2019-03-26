library(phylosim)


### Name: saveAlignment.PhyloSim
### Title: Save the alignment stored in a PhyloSim object in a Fasta file
### Aliases: saveAlignment.PhyloSim PhyloSim.saveAlignment
###   saveAlignment,PhyloSim-method

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
	# save the alignment
	file<-paste("PhyloSim_dummy_fasta_",Sys.getpid(),".fas",sep="");
	saveAlignment(sim,file=file,paranoid=TRUE);
	# print out the Fasta file
	cat(paste(scan(file=file,what=character(),sep="\n"),collapse="\n"));cat("\n");
	# delete Fasta file
	unlink(file);
 


