library(phylosim)


### Name: getAlphabet.GeneralSubstitution
### Title: Get the Alphabet object aggregated by a GeneralSubstitution
###   object
### Aliases: getAlphabet.GeneralSubstitution
###   GeneralSubstitution.getAlphabet
###   getAlphabet,GeneralSubstitution-method

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
 


