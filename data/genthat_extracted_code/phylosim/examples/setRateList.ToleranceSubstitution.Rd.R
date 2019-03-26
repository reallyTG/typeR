library(phylosim)


### Name: setRateList.ToleranceSubstitution
### Title: Setting the rates for a ToleranceSubstitution object
### Aliases: setRateList.ToleranceSubstitution
###   ToleranceSubstitution.setRateList
###   setRateList,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=3))
	# get the event rates from the unscaled Q matrix
	getRateList(p)
	# get rates from the unscaled rate matrix via virtual field
	p$rateList
	# set rates in the unscaled rate matrix
	setRateList(p, list("0->1"=1,"1->0"=1))
	p$rateList
	# set rates in the unscaled rate matrix via virtual field
	p$rateList<-list("0->1"=3,"1->0"=1);
	# check the contenst of the associated QMatrix object
	summary(p$QMatrix)
 


