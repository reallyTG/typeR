library(phylosim)


### Name: deleteSubSequence.Sequence
### Title: Delete a collection of sites aggregated by a Sequence object
### Aliases: deleteSubSequence.Sequence Sequence.deleteSubSequence
###   deleteSubSequence,Sequence-method

### ** Examples

	# create a nucleotide sequence
	s<-NucleotideSequence(string="ATATATATATATATAT")
	# delete sites 2, 4 and 6
	deleteSubSequence(s,c(2,4,6))
	s
	# delete sites in the range 3:6
	deleteSubSequence(s,3:6)
	s
 


