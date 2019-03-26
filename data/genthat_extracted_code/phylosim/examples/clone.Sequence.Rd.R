library(phylosim)


### Name: clone.Sequence
### Title: Clone a Sequence object
### Aliases: clone.Sequence Sequence.clone clone,Sequence-method

### ** Examples

	# cretate a nucleotide sequence
	s<-NucleotideSequence(string="ATG")
	# clone the sequence
	cs<-clone(s)
	# get some properties
	equals(s,s)
	equals(s,cs)
	cs$ancestral
	cs$sites[[1]]$ancestral
 


