library(phylosim)


### Name: setStates.Sequence
### Title: Set the states for a set of Site objects aggregated by a
###   Sequence object
### Aliases: setStates.Sequence Sequence.setStates
###   setStates,Sequence-method

### ** Examples

	# create a sequence object of length 10
	s<-Sequence(alphabets=list(NucleotideAlphabet()),length=10)
	# set the states in some ranges
	setStates(s,c("A","T","A"),index=1:5)
	setStates(s,c("G","C"),index=6:10)
	# display sequence
	s
	# set the states for the whole Sequence object
	setStates(s,c("A","T","T","A"))
	s
	# set states via virtual field
	s$states<-c("A","T")
	s
 


