library(phylosim)


### Name: getRateList.GeneralSubstitution
### Title: Get a list of events and their unscaled rates from a
###   GeneralSubstitution object
### Aliases: getRateList.GeneralSubstitution
###   GeneralSubstitution.getRateList
###   getRateList,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object
	# provide an Alphabet object and the rates
	p<-GeneralSubstitution(alphabet=BinaryAlphabet(), rate.list=list("1->0"=1,"0->1"=3))
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
 


