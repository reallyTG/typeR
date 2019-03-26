library(phylosim)


### Name: clearStates.Sequence
### Title: Set the states of a collection of Site objects aggregated by a
###   Sequence object to undefined (NA)
### Aliases: clearStates.Sequence Sequence.clearStates
###   clearStates,Sequence-method

### ** Examples

	# create a nucleotide sequence
	s<-NucleotideSequence(string="ATGC")
	s
	# set states to NA in the range 2:3
	clearStates(s,2:3)
	s
	# set all states to NA
	clearStates(s)
	s
 


