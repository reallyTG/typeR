library(phylosim)


### Name: sampleState.ToleranceSubstitution
### Title: Sample a state from the equlibrium distribution of a
###   ToleranceSubstitution object
### Aliases: sampleState.ToleranceSubstitution
###   ToleranceSubstitution.sampleState
###   sampleState,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# get equlibrium distribution
	getEquDist(p)
	# get equilibrium distribution via virtual field
	p$equDist
	# sample from equilibrium distribution
	sampleState(p)
 


