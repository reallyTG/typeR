library(phylosim)


### Name: getCumulativeRatesFromRange.Sequence
### Title: Get the cumulative site rates for a collection of Site objects
###   aggregated by a Sequence object
### Aliases: getCumulativeRatesFromRange.Sequence
###   Sequence.getCumulativeRatesFromRange
###   getCumulativeRatesFromRange,Sequence-method

### ** Examples

	# create a sequence with some processes attached
	s<-Sequence(
               string="ATGC",
               alphabets=list(NucleotideAlphabet()),
               processes=list(list(JC69()),list(JC69(),GTR()))
               )
	# get cumulative rates for positions 1 and 3
	getCumulativeRatesFromRange(s,c(1,3))
	# get all cumulative rates via virtual field
	s$cumulativeRates	# via the "getCumulativeRates.Sequence" method
 


