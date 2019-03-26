library(phylosim)


### Name: getStates.Sequence
### Title: Get the states of a set of Site objects aggregated by a Sequence
###   object
### Aliases: getStates.Sequence Sequence.getStates
###   getStates,Sequence-method

### ** Examples

	# create a sequence object
	s<-Sequence(alphabets=list(NucleotideAlphabet()),string="AATTGCCCCCTTGG")
	# get all Site states
	getStates(s)
	# get the states for a collection of sites
	getStates(s,c(1:3,5,8))
	# get states via virtual field
	s$states
 


