library(phylosim)


### Name: globalConsistencyCheck.PSRoot
### Title: Check the consistency of all objects inheriting form PSRoot in
###   the current environment
### Aliases: globalConsistencyCheck.PSRoot PSRoot.globalConsistencyCheck
###   globalConsistencyCheck,PSRoot-method

### ** Examples

	# create some objects
	a<-NucleotideAlphabet()
	s<-Site()
	p<-Process()
	# ask for a global consistency check
	PSRoot$globalConsistencyCheck();
 


