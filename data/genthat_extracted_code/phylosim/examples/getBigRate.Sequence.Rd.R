library(phylosim)


### Name: getBigRate.Sequence
### Title: Get the sum of all active event rates from a Sequence object
### Aliases: getBigRate.Sequence Sequence.getBigRate
###   getBigRate,Sequence-method

### ** Examples

	# create a nucleotide sequence attach a process
	s<-NucleotideSequence(length=5);
	s$processes<-list(list(JC69()))
	# get the sum of active event rates
	getBigRate(s)	# returns NA because site states are undefined
	# set site states
	s$states<-c("A","T")
	# get big rate via virtual field
	s$bigRate
 


