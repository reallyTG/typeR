library(phylosim)


### Name: sampleState.GeneralSubstitution
### Title: Sample a state from the equlibrium distribution of a
###   GeneralSubstitution object
### Aliases: sampleState.GeneralSubstitution
###   GeneralSubstitution.sampleState
###   sampleState,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object
	# provide an Alphabet object and the rates
	p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# get equlibrium distribution
	getEquDist(p)
	# get equilibrium distribution via virtual field
	p$equDist
	# sample from equilibrium distribution
	sampleState(p)
 


