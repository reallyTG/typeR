library(phylosim)


### Name: getAlphabets.Sequence
### Title: Get the list of the Alphabet objects attached to the Site
###   objects aggregated by a Sequence object
### Aliases: getAlphabets.Sequence Sequence.getAlphabets
###   getAlphabets,Sequence-method

### ** Examples

	# create a Sequence object with NucleotideAlphabet
	#and BinaryAlphabet objects attached
	s<-Sequence(alphabets=list(NucleotideAlphabet(),BinaryAlphabet()),length=5)
	setStates(s,c("A","0"))
	# get the list of attached Alphabet objects
	getAlphabets(s)
	# get Alphabets from a range
	getAlphabets(s,c(2:3,5))
	# get alphabets via virtual field
	s$alphabets
 


