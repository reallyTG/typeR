library(phylosim)


### Name: getEventRateAtSite.ToleranceSubstitution
### Title: Get the site spcific rate of an event from a
###   ToleranceSubstitution object
### Aliases: getEventRateAtSite.ToleranceSubstitution
###   ToleranceSubstitution.getEventRateAtSite
###   getEventRateAtSite,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=1))
	# create a Site object
	s<-Site(alphabet=BinaryAlphabet())
	# attach process p to site s
	s$processes<-list(p)
	# set the rate multiplier for s and p
       setParameterAtSite(p,s,id="rate.multiplier",value=2)
	# get the site specific rate of "0->1" by name
	getEventRateAtSite(p,s,"0->1")
	# get the site specific rate of "0->1" by states
	getEventRateAtSite(p,s,from="0",to="1")
 


