library(phylosim)


### Name: getDist.ContinuousDeletor
### Title: Get the length sampling expression
### Aliases: getDist.ContinuousDeletor ContinuousDeletor.getDist
###   getDist,ContinuousDeletor-method

### ** Examples

	# create object
	o<-ContinuousDeletor(rate=1)
	# set/get length sampling expression
	setDist(o, expression(rnorm(1,mean=3, sd=2)))
	getDist(o)
	# set/get length sampling expression via virtual field
	o$dist<-expression(rnorm(1,mean=6,sd=3))
	o$dist
	# set maxLength
	o$maxLength<-10
	# propose a length
	proposeLength(o)
 


