library(phylosim)


### Name: plusInvGamma.Sequence
### Title: Sample the rate multiplier parameters of a Process from an
###   I+Gamma distribution for a collection of Site objects aggregated by a
###   Sequence object
### Aliases: plusInvGamma.Sequence Sequence.plusInvGamma
###   plusInvGamma,Sequence-method

### ** Examples

	# create a sequence
	s<-NucleotideSequence(length=20)
	# attach a process
	p<-JC69()
	attachProcess(s,p)
	# get rate multipliers
	getRateMultipliers(s,p)	# the default value is 1.0
	# sample rate multipliers in range 1:5 from I+discrete Gamma
	plusInvGamma(s,p,pinv=0.5,shape=0.5,1:5)
	# get rate multipliers
	getRateMultipliers(s,p)	# the default value is 1.0
	# sample rates from an I+continuos Gamma model
	plusInvGamma(s,p,pinv=0.5,shape=0.5,1:5,ncat="cont")
	# get rate multipliers
	getRateMultipliers(s,p)
 


