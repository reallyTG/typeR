library(phylosim)


### Name: setParameterAtSites.Sequence
### Title: Set the values of a site-process specific paramater for a
###   process and a collection of Site objects aggregated by a Sequence
###   object
### Aliases: setParameterAtSites.Sequence Sequence.setParameterAtSites
###   setParameterAtSites,Sequence-method

### ** Examples

	# create a sequence, attach a process
	p<-K80()
	s<-Sequence(length=6,alphabets=list(NucleotideAlphabet()),processes=list(list(p)))
	# set a new pattern of rate multipliers in the range 1:3,
   # the default value is 1.0 by the way
	setParameterAtSites(s,p,"rate.multiplier",c(2,3),1:3)
	# get rate multipliers
	getParameterAtSites(s,p,"rate.multiplier")
	# set a new value for the whole sequence
	setParameterAtSites(s,p,"rate.multiplier",0.5)
	# get rate multipliers
	getParameterAtSites(s,p,"rate.multiplier")
 


