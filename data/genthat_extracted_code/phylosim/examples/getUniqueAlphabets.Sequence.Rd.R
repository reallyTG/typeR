library(phylosim)


### Name: getUniqueAlphabets.Sequence
### Title: Get the list of unique Alphabet objects associated to Site
###   objects aggaregated by a Sequence object
### Aliases: getUniqueAlphabets.Sequence Sequence.getUniqueAlphabets
###   getUniqueAlphabets,Sequence-method

### ** Examples

	# create a Sequence object with some Alphabet objects attached
	s<-Sequence(
               alphabets=list(NucleotideAlphabet(),
               BinaryAlphabet(),
               NucleotideAlphabet()),
               length=10
               )
	# get the list of attached alphabets
	s$alphabets
	# get the unique list of attahced Alphabet objects
	getUniqueAlphabets(s)
 


