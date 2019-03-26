library(phylosim)


### Name: JTT.dcmut
### Title: The JTT.dcmut empirical amino acid substitution model
### Aliases: JTT.dcmut

### ** Examples

	# create substitution model object
	p<-JTT.dcmut()
	# get object summary
	summary(p)
	# display a bubble plot
	plot(p)

       # The following code demonstrates how to use
       # the process in a simulation.

	# create a sequence, attach process p
	s<-AminoAcidSequence(length=10,processes=list(list(p)) )
	# sample states
	sampleStates(s)
       # make the first threee positions invariable
       setRateMultipliers(s,p,0,1:3)
       # get rate multipliers
       getRateMultipliers(s,p)
       # create a simulation object
       sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
       # run simulation
       Simulate(sim)
       # print alignment
       sim$alignment
 


