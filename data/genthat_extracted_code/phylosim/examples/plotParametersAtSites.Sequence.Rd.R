library(phylosim)


### Name: plotParametersAtSites.Sequence
### Title: Plot the value of a site-process specifc paramter for a
###   collection of Site objects aggregated by a Sequence object
### Aliases: plotParametersAtSites.Sequence Sequence.plotParametersAtSites
###   plotParametersAtSites,Sequence-method

### ** Examples

	# create a nucleotide sequence with a process attached
	p<-JC69()
	s<-NucleotideSequence(string="ATGGCCA",processes=list(list(p)))
	# plot rate multipliers in range 1:4
	plotParametersAtSites(s,p,"rate.multiplier",1:4)
	# plot rate multiplier for the full sequence
	plotParametersAtSites(s,p,"rate.multiplier")
 


