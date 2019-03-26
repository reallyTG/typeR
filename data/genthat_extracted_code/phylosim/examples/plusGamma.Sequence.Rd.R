library(phylosim)


### Name: plusGamma.Sequence
### Title: Sample the rate multiplier parameters of a Process from a Gamma
###   distribution for a collection of Site objects aggregated by a
###   Sequence object
### Aliases: plusGamma.Sequence Sequence.plusGamma
###   plusGamma,Sequence-method

### ** Examples

	# create a sequence
	s<-NucleotideSequence(length=20)
	# attach a process
	p<-JC69()
	attachProcess(s,p)
	# get rate multipliers
	getRateMultipliers(s,p)	# the default value is 1.0
	# sample rate multipliers in range 1:5 from a discrete
	#gamma distribution with shape parameter 0.5
	plusGamma(s,p,0.5,1:5)
	# get rate multipliers
	getRateMultipliers(s,p)	# the default value is 1.0
	# sample rates from a continuous gamma distribution
	# with shape parameter 0.5
	plusGamma(s,p,0.5,ncat="cont")
	# get rate multipliers
	getRateMultipliers(s,p)
 


