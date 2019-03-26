library(phylosim)


### Name: readAlignment.PhyloSim
### Title: Read alignment from file
### Aliases: readAlignment.PhyloSim PhyloSim.readAlignment
###   readAlignment,PhyloSim-method

### ** Examples

	# get a safe file name
	fname<-paste("PhyloSim_dummy_fas_",Sys.getpid(),sep="")
	# write out a fasta alignment
	cat("> t3\nGTCTTT-CG-\n",file=fname);
	cat("> t4\nG--TC-TCGG\n",file=fname,append=TRUE);
	cat("> t2\nG--TC-TCGG\n",file=fname,append=TRUE);
	cat("> t1\nGTC-G-TCGG",file=fname,append=TRUE);
	# construct a PhyloSim object,
	# set the phylo object
	sim<-PhyloSim(phylo=rcoal(4))
	# read the alignment
	readAlignment(sim,fname)
	# remove alignment file
	unlink(fname)
	# plot the tree & alignment
	plot(sim)
 


