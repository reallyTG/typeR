library(phylosim)


### Name: getSites.Sequence
### Title: Get the list of the Site object aggregated in a Sequence object
### Aliases: getSites.Sequence Sequence.getSites getSites,Sequence-method

### ** Examples

	# create a sequence object
	s<-Sequence(alphabets=list(NucleotideAlphabet()),string="AATTGCCC")
	# get the list of aggregated Site objects
	getSites(s)
	# get Site objects via virtual field
	s$sites
 


