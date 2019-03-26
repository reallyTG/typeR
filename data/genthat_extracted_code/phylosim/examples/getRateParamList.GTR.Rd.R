library(phylosim)


### Name: getRateParamList.GTR
### Title: Get the rate parameters
### Aliases: getRateParamList.GTR GTR.getRateParamList
###   getRateParamList,GTR-method

### ** Examples

	# create GTR object
	p<-GTR()
	# set/get rate parameters
	setRateParamList(p,list(
                       "a"=1, "b"=2, "c"=3,
                       "d"=1, "e"=2, "f"=3
        ))
	getRateParamList(p)
	# set/get rate parameters via virtual field
	p$rateParamList<-list(
                       "a"=4, "b"=1, "c"=4,
                       "d"=1, "e"=4, "f"=1
        )
	p$rateParamList
	# get object summary
	summary(p)
 


