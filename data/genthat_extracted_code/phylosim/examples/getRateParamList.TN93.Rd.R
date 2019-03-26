library(phylosim)


### Name: getRateParamList.TN93
### Title: Get the rate parameters
### Aliases: getRateParamList.TN93 TN93.getRateParamList
###   getRateParamList,TN93-method

### ** Examples

	# create TN93 object
	p<-TN93()
	# set/get rate parameters
	setRateParamList(p,list(
		"Alpha1"=1,
		"Alpha2"=2,
		"Beta"=0.5
        ))
	getRateParamList(p)
	# set/get rate parameters via virtual field
	p$rateParamList<-list(
		"Alpha1"=1,
		"Alpha2"=1,
		"Beta"=3
        )
	p$rateParamList
	# get object summary
	summary(p)
 


