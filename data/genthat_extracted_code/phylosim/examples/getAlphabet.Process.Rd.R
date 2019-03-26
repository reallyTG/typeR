library(phylosim)


### Name: getAlphabet.Process
### Title: Get the Alphabet object associated with a given Process object
### Aliases: getAlphabet.Process Process.getAlphabet
###   getAlphabet,Process-method

### ** Examples

	# create a process object
	p<-Process(alphabet=NucleotideAlphabet())
	# get associated Alphabet object
	getAlphabet(p)
	# via virtual field
	p$alphabet
 


