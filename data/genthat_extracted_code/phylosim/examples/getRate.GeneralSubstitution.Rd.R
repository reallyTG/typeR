library(phylosim)


### Name: getRate.GeneralSubstitution
### Title: Get an unscaled rate of an event from a GeneralSubstitution
###   object
### Aliases: getRate.GeneralSubstitution GeneralSubstitution.getRate
###   getRate,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object
	# provide an Alphabet object and the rates
	p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# get the unscaled rate of "0->1" by name
	getRate(p,"0->1")
	# get the unscaled rate of "0->1" by states
	getRate(p,from="0",to="1")
 


