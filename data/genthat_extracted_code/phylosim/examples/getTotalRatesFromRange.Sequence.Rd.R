library(phylosim)


### Name: getTotalRatesFromRange.Sequence
### Title: Get the vector of total site rates for a collection of Site
###   objects aggregated by a Sequence object
### Aliases: getTotalRatesFromRange.Sequence
###   Sequence.getTotalRatesFromRange
###   getTotalRatesFromRange,Sequence-method

### ** Examples

	# create a sequence with some processes attached
	s<-Sequence(
               string="ATGC",
               alphabets=list(NucleotideAlphabet()),
               processes=list(list(JC69()),list(JC69(),GTR()))
               )
	# get total rates for positions 1 and 3
	getTotalRatesFromRange(s,c(1,3))
	# get all total rates via virtual field
	s$totalRates	# via the "getTotalRates.Sequence" method
 


