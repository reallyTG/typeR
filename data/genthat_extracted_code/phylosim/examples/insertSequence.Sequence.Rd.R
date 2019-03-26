library(phylosim)


### Name: insertSequence.Sequence
### Title: Insert a Sequence object into another Sequence object after a
###   specified position
### Aliases: insertSequence.Sequence Sequence.insertSequence
###   insertSequence,Sequence-method

### ** Examples

	# create some sequence objects.
	target<-NucleotideSequence(string="AAAAAAAAAAA")
	insert<-NucleotideSequence(string="GGGGGGGGGGG")
	# insert after position 5
	insertSequence(target,insert,5)
	# print the target sequence
	target
 


