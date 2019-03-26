library(phylosim)


### Name: setRate.ToleranceSubstitution
### Title: Set an unscaled rate for an event from a ToleranceSubstitution
###   object
### Aliases: setRate.ToleranceSubstitution ToleranceSubstitution.setRate
###   setRate,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# set the unscaled rate by event name
	setRate(p,"0->1",2)
	# get the unscaled rate of "0->1" by name
	getRate(p,"0->1")
	# set the unscaled rate by states
	setRate(p,"0->1",0.5)
	# get the unscaled rate of "0->1" by states
	getRate(p,from="0",to="1")
 


