library(phylosim)


### Name: getRateParamList.HKY
### Title: Get the rate parameters
### Aliases: getRateParamList.HKY HKY.getRateParamList
###   getRateParamList,HKY-method

### ** Examples

	# create HKY object
	p<-HKY()
	# set/get rate parameters
	setRateParamList(p,list(
		"Alpha"=1,
		"Beta"=0.5
        ))
	getRateParamList(p)
	# set/get rate parameters via virtual field
	p$rateParamList<-list(
		"Alpha"=1,
		"Beta"=3
        )
	p$rateParamList
	# get object summary
	summary(p)
 


