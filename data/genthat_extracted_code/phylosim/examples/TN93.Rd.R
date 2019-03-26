library(phylosim)


### Name: TN93
### Title: The TN93 class
### Aliases: TN93

### ** Examples

	# create substitution process object
       p<-TN93(rate.params=list( "Alpha1"=4,"Alpha2"=3,"Beta"=2),
		base.freqs=c(2,2,1,3)/9
	)
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
 


