library(phylosim)


### Name: copySubSequence.Sequence
### Title: Copy a collection of Site objects aggregated by a Sequence
###   object into a new Sequence object
### Aliases: copySubSequence.Sequence Sequence.copySubSequence
###   copySubSequence,Sequence-method

### ** Examples

	# create a nucleotide sequence
	s<-NucleotideSequence(string="ATATATATATATATATA")
	# copy sites in the range 3:8 in a new object
	s2<-copySubSequence(s,3:8)
	s2
	# copy sites 1,3 and 5 from s2
	s3<-copySubSequence(s2,c(1,3,5))
	s3
 


