library(phylosim)


### Name: plot.Sequence
### Title: Plot the total site rates for a collection of Site objects
###   aggregated by a Sequence object
### Aliases: plot.Sequence Sequence.plot plot,Sequence-method

### ** Examples

	# create a nucleotide sequence with a process attached
	s<-NucleotideSequence(string="ATGGCCA",processes=list(list(JC69())))
	# plot total rates in range 1:4
	plot(s,1:4)
	# plot all total rates
	plot(s)
 


