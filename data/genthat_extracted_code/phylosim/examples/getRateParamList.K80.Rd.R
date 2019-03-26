library(phylosim)


### Name: getRateParamList.K80
### Title: Get the rate parameters
### Aliases: getRateParamList.K80 K80.getRateParamList
###   getRateParamList,K80-method

### ** Examples

	# create K80 object
	p<-K80()
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
 


