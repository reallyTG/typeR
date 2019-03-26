library(phylosim)


### Name: setRateParamList.K81
### Title: Set the rate parameters
### Aliases: setRateParamList.K81 K81.setRateParamList
###   setRateParamList,K81-method

### ** Examples

	# create K81 object
	p<-K81()
	# set/get rate parameters
	setRateParamList(p,list(
		"Alpha"=1,
		"Beta"=0.5,
		"Gamma"=2
        ))
	getRateParamList(p)
	# set/get rate parameters via virtual field
	p$rateParamList<-list(
		"Alpha"=1,
		"Beta"=3,
		"Gamma"=2
        )
	p$rateParamList
	# get object summary
	summary(p)
 


