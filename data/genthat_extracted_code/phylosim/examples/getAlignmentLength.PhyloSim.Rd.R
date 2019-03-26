library(phylosim)


### Name: getAlignmentLength.PhyloSim
### Title: Get the alignment length from a PhyloSim object
### Aliases: getAlignmentLength.PhyloSim PhyloSim.getAlignmentLength
###   getAlignmentLength,PhyloSim-method

### ** Examples

	# create a PhyloSim object and run a simulation:
	sim<-Simulate(
                     PhyloSim(phy=rcoal(3),
                     root=NucleotideSequence(string="ATGC", proc=list(list(JC69())) ) )
             )
	# get the alignment length
	getAlignmentLength(sim)
 


