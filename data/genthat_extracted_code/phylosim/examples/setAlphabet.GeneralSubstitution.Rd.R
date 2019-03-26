library(phylosim)


### Name: setAlphabet.GeneralSubstitution
### Title: Set the Alphabet object aggregated by a GeneralSubstitution
###   object
### Aliases: setAlphabet.GeneralSubstitution
###   GeneralSubstitution.setAlphabet
###   setAlphabet,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object with an attached BinaryAlphabet object
	p<-GeneralSubstitution(alphabet=BinaryAlphabet())
	# get object summary
	summary(p)
	# get alphabet
	getAlphabet(p)
	# get alphabet via virtual field
	p$alphabet
	# set a new alphabet
	setAlphabet(p,NucleotideAlphabet())
	summary(p)
	# set alphabet via virtual field
	p$alphabet<-BinaryAlphabet()
	p$alphabet
 


