library(phylosim)


### Name: getAlphabet.QMatrix
### Title: Get the Alphabet object associated with a QMatrix object
### Aliases: getAlphabet.QMatrix QMatrix.getAlphabet
###   getAlphabet,QMatrix-method

### ** Examples

	# create a QMatrix object
	m<-QMatrix()
	# set the alphabet
	setAlphabet(m,NucleotideAlphabet())
	# get the alphabet
	getAlphabet(m)
	# set alphabet via virtual field
	m$alphabet<-BinaryAlphabet()
	summary(m)
 


