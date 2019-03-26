library(phylosim)


### Name: getRootSeq.PhyloSim
### Title: Get the root sequence aggregated by a PhyloSim object
### Aliases: getRootSeq.PhyloSim PhyloSim.getRootSeq
###   getRootSeq,PhyloSim-method

### ** Examples

	# create some objects
	sim<-PhyloSim(phylo=rcoal(3));
	seq<-NucleotideSequence(string="ATGCC");
	# set/get root sequence
	setRootSeq(sim, seq);
	getRootSeq(sim, seq);
	# set/get root sequence via virtual field
	sim$rootSeq<-BinarySequence(string="111000111000");
	sim$rootSeq;

 


