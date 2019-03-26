library(phylosim)


### Name: getEventRate.ToleranceSubstitution
### Title: Get the scaled rate of an event from a ToleranceSubstitution
###   object
### Aliases: getEventRate.ToleranceSubstitution
###   ToleranceSubstitution.getEventRate
###   getEventRate,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# get the scaled rate of "0->1" by name
	getEventRate(p,"0->1")
	# get the scaled rate of "0->1" by states
	getEventRate(p,from="0",to="1")
 


