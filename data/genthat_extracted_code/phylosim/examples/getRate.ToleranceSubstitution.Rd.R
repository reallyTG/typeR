library(phylosim)


### Name: getRate.ToleranceSubstitution
### Title: Get an unscaled rate of an event from a ToleranceSubstitution
###   object
### Aliases: getRate.ToleranceSubstitution ToleranceSubstitution.getRate
###   getRate,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# get the unscaled rate of "0->1" by name
	getRate(p,"0->1")
	# get the unscaled rate of "0->1" by states
	getRate(p,from="0",to="1")
 


