library(phylosim)


### Name: getSymbolFreqs.Sequence
### Title: Get a table with the frequencies of the states of a collection
###   of Site objects aggregated by a Sequence object
### Aliases: getSymbolFreqs.Sequence Sequence.getSymbolFreqs
###   getSymbolFreqs,Sequence-method

### ** Examples

	# create a nucleotide sequence
	s<-NucleotideSequence(length=30,processes=list(list(JC69())))
	# sample states
	sampleStates(s)
	# get state frequencies from ranges 1:10 and 20:30
	getSymbolFreqs(s,c(1:10,20:30))
	# get symbol frequencies for the full sequence
	getSymbolFreqs(s)
 


