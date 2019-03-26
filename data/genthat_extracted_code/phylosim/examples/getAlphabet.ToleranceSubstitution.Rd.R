library(phylosim)


### Name: getAlphabet.ToleranceSubstitution
### Title: Get the Alphabet object aggregated by a ToleranceSubstitution
###   object
### Aliases: getAlphabet.ToleranceSubstitution
###   ToleranceSubstitution.getAlphabet
###   getAlphabet,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object with an attached BinaryAlphabet object
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet())
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
 


