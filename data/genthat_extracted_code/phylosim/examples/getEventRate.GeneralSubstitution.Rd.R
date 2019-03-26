library(phylosim)


### Name: getEventRate.GeneralSubstitution
### Title: Get the scaled rate of an event from a GeneralSubstitution
###   object
### Aliases: getEventRate.GeneralSubstitution
###   GeneralSubstitution.getEventRate
###   getEventRate,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object
	# provide an Alphabet object and the rates
	p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# get the scaled rate of "0->1" by name
	getEventRate(p,"0->1")
	# get the scaled rate of "0->1" by states
	getEventRate(p,from="0",to="1")
 


