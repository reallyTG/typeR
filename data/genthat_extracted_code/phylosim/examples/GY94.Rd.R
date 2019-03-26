library(phylosim)


### Name: GY94
### Title: The GY94 class
### Aliases: GY94

### ** Examples

	# create a GY94 object
	p<-GY94(kappa=2)
	# check if inherits from GY94
	is.GY94(p)
	# get object summary
	summary(p)
	# display a bubble plot
	plot(p)
	# create a codon sequence, attach process
	s<-CodonSequence(length=5, processes=list(list(p)))
	# sample states
	sampleStates(s)
	# make first three positions invariable
	setRateMultipliers(s,p,0,1:3)
	# sample omega values from the M3 (discrete) model.
	omegaVarM3(s,p,omegas=c(0,1,2,3),probs=c(2/5,1/5,1/5,1/5))
	# get a histogram of omega values in s
	omegaHist(s,p,breaks=50)
       sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
       # run simulation
       Simulate(sim)
	# get the list of recorded per-branch event counts
	getBranchEvents(sim)
	# export the number of synonymous substitutions as a phylo object
	syn.subst<-exportStatTree(sim,"nr.syn.subst")
	syn.subst
	# plot the exported phylo object
	plot(syn.subst)
	# print alignment
	sim$alignment
 


