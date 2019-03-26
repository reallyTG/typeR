library(phylosim)


### Name: setAlphabet.QMatrix
### Title: Set the Alphabet object for a QMatrix object
### Aliases: setAlphabet.QMatrix QMatrix.setAlphabet
###   setAlphabet,QMatrix-method

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
 


