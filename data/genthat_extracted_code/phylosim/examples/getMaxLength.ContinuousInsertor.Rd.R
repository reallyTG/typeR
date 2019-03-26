library(phylosim)


### Name: getMaxLength.ContinuousInsertor
### Title: Get the maximum length
### Aliases: getMaxLength.ContinuousInsertor
###   ContinuousInsertor.getMaxLength
###   getMaxLength,ContinuousInsertor-method

### ** Examples

	# create object
	o<-ContinuousInsertor(rate=1)
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
 


