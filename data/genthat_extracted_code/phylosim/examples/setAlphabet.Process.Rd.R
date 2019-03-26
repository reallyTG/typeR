library(phylosim)


### Name: setAlphabet.Process
### Title: Assotiate an Alphabet object with a Process object
### Aliases: setAlphabet.Process Process.setAlphabet
###   setAlphabet,Process-method

### ** Examples

	# create objects
	a<-AminoAcidAlphabet()
	p<-Process()
	# assotiate p with Alphabet object a
	setAlphabet(p,a)
	p$alphabet
	# assotiate p with a new NucleotideAlphabet via virtual field
	p$alphabet<-NucleotideAlphabet()
	p$alphabet
 


