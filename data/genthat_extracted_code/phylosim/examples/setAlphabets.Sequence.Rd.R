library(phylosim)


### Name: setAlphabets.Sequence
### Title: Assotiate Alphabet objects to a set of Site objects aggregated
###   by a Sequence object
### Aliases: setAlphabets.Sequence Sequence.setAlphabets
###   setAlphabets,Sequence-method

### ** Examples

	# create a Sequence object
	s<-Sequence(length=10)
	# set the alphabets for range 1:5
	setAlphabets(s,list(NucleotideAlphabet(),BinaryAlphabet()),1:5)
	# set the alphabets for range 6:10
	setAlphabets(s,list(AminoAcidAlphabet()),6:10)
	# get the list of attached Alphabet objects
	getAlphabets(s)
	# get Alphabets from a range
	getAlphabets(s,c(2:3,5))
	# set alphabets via virtual field
	s$alphabets<-list(BinaryAlphabet(),NucleotideAlphabet())
	# get alphabets via virtual field
	s$alphabets
 


