library(phylosim)


### Name: PAM.dcmut
### Title: The PAM.dcmut empirical amino acid substitution model
### Aliases: PAM.dcmut

### ** Examples

	# create substitution model object
	p<-PAM.dcmut()
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
       # make the first three invariable
       setRateMultipliers(s,p,0,1:3)
       # get rate multipliers
       getRateMultipliers(s,p)
       # create a simulation object
       sim<-PhyloSim(root.seq=s,phylo=rcoal(2))
       # run simulation
       Simulate(sim)
       # print alignment
       sim$alignment
 


