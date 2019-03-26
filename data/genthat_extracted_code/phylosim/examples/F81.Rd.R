library(phylosim)


### Name: F81
### Title: The F81 class
### Aliases: F81

### ** Examples

	# create substitution process object
       p<-F81(base.freqs=c(1,2,3,4)/10)
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
 


