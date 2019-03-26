library(phylosim)


### Name: ECMrest
### Title: The ECMrest empirical codon substitution model
### Aliases: ECMrest

### ** Examples

	# create substitution model object
	p<-ECMrest()
	# get object summary
	summary(p)
	# display a bubble plot
	plot(p)

       # The following code demonstrates how to use
       # the process in a simulation.

	# create a sequence, attach process p
	s<-CodonSequence(length=10,processes=list(list(p)) )
	# sample states
	sampleStates(s)
       # make the first three positions invariable
       setRateMultipliers(s,p,0,1:3)
       # get rate multipliers
       getRateMultipliers(s,p)
       # create a simulation object
       sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
       # run simulation
       Simulate(sim)
       # print alignment
       sim$alignment
 


