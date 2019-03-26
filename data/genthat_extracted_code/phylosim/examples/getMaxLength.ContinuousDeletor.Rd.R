library(phylosim)


### Name: getMaxLength.ContinuousDeletor
### Title: Get the maximum length
### Aliases: getMaxLength.ContinuousDeletor ContinuousDeletor.getMaxLength
###   getMaxLength,ContinuousDeletor-method

### ** Examples

	# create object
	o<-ContinuousDeletor(rate=1)
	# set length sampling expression via virtual field
	o$dist<-expression(rnorm(1,mean=6,sd=3))
	# set/get maxLength
	setMaxLength(o, 3)
	getMaxLength(o)
	# set/get maxLength via virtual field
	o$maxLength<-10
	o$maxLength
	# propose a length
	proposeLength(o)
 


