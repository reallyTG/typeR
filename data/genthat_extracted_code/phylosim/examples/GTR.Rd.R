library(phylosim)


### Name: GTR
### Title: The GTR class
### Aliases: GTR

### ** Examples

	# create substitution process object
       p<-GTR(
		rate.params=list(
			"a"=1, "b"=2, "c"=3,
			"d"=1, "e"=2, "f"=3
		),
		base.freqs=c(2,2,1,1)/6
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
	# create a simulation object and run simulation
	sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
	Simulate(sim)
	# print alignment
	sim$alignment
 


