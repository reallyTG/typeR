library(phylosim)


### Name: UNREST
### Title: The UNREST class
### Aliases: UNREST

### ** Examples

       p<-UNREST(rate.list=list(
		"T->C"=1, "T->A"=2, "T->G"=3, "C->T"=4, "C->A"=1,
		"C->G"=2, "A->T"=3, "A->C"=4, "A->G"=1, "G->T"=2,
		"G->C"=3, "G->A"=4
	))
       # get a summary
       summary(p)
	# display a bubble plot
	plot(p)

	# The following code demonstrates how to use
	# the process in a simulation.

	# create a sequence, attach process p
	s<-NucleotideSequence(length=20,processes=list(list(p)))
	# sample states
	sampleStates(s)
	# make the first five positions invariable
	setRateMultipliers(s,p,0,1:5)
	# get rate multipliers
	getRateMultipliers(s,p)
	# create a simulation object
	sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
	# run simulation
	Simulate(sim)
	# print alignment
	sim$alignment
 


