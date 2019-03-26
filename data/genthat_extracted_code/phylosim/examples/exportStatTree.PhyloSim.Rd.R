library(phylosim)


### Name: exportStatTree.PhyloSim
### Title: Export the per-branch counts of an event as a phylo object
### Aliases: exportStatTree.PhyloSim PhyloSim.exportStatTree
###   exportStatTree,PhyloSim-method

### ** Examples

	# Create a PhyloSim object.
	# Provide the phylo object
	# and the root sequence.

	# NOTE: this will be a little bit slow
	sim<-PhyloSim(
		phylo=rcoal(3),
		root.seq=CodonSequence(
                               string="ATGATTATT",
                               processes=list(list(GY94(kappa=2,omega.default=0.5)))
                               )
	);
	# make the tree longer to have more events
	scaleTree(sim,5)
	# plot the tree
	plot(sim)
	# run simulation
	Simulate(sim)
	# get the list of recorded per-branch event counts
	getBranchEvents(sim)
	# export the number of substitutions as a phylo object
	subst<-exportStatTree(sim,"substitution")
	# plot the exported phylo object
	plot(subst)
	#export the number of synonymous substitutions as a phylo object
	subst<-exportStatTree(sim,"nr.syn.subst")
	# plot the exported phylo object
	plot(subst)
 


