library(phylosim)


### Name: setRate.GeneralInDel
### Title: Set the general rate
### Aliases: setRate.GeneralInDel GeneralInDel.setRate
###   setRate,GeneralInDel-method

### ** Examples

	# create a GeneralInDel object
	o<-GeneralInDel(rate=0.5)
	# get/set general rate
	getRate(o)
	setRate(o, 1.5)
	# get/set rate via virtual field
	o$rate
	o$rate<-0.3
	o$rate
 


