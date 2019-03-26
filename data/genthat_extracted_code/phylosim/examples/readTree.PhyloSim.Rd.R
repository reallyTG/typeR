library(phylosim)


### Name: readTree.PhyloSim
### Title: Read tree from file
### Aliases: readTree.PhyloSim PhyloSim.readTree readTree,PhyloSim-method

### ** Examples

	# get a safe file name
	fname<-paste("PhyloSim_dummy_fas_",Sys.getpid(),sep="")
	# write out a fasta alignment
	cat("(a,(b,c));",file=fname);
	# construct a PhyloSim object:
	sim<-PhyloSim()
	# read the alignment
	readTree(sim,fname)
	# remove alignment file
	unlink(fname)
	# plot the tree
	plot(sim)
 


