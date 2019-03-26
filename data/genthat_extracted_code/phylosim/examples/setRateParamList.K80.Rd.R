library(phylosim)


### Name: setRateParamList.K80
### Title: Set the rate parameters
### Aliases: setRateParamList.K80 K80.setRateParamList
###   setRateParamList,K80-method

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
 


