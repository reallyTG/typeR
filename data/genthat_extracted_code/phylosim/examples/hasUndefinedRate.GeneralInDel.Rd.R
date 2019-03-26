library(phylosim)


### Name: hasUndefinedRate.GeneralInDel
### Title: Check whether the general rate of a GeneralInDel object is
###   undefined
### Aliases: hasUndefinedRate.GeneralInDel GeneralInDel.hasUndefinedRate
###   hasUndefinedRate,GeneralInDel-method

### ** Examples

	# create a GeneralInDel object
	o<-GeneralInDel()
	# check if the general rate is undefined
	hasUndefinedRate(o)
	# set general rate
	o$rate<-1
	# check rate again
	hasUndefinedRate(o)
 


