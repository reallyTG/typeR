library(phylosim)


### Name: plot.ContinuousInsertor
### Title: Plot the density of proposed lengths
### Aliases: plot.ContinuousInsertor ContinuousInsertor.plot
###   plot,ContinuousInsertor-method

### ** Examples

	# create object
	o<-ContinuousInsertor(rate=1)
	# set length sampling expression via virtual field
	o$dist<-expression(rnorm(1,mean=10,sd=4))
	# set maxLength
	setMaxLength(o, 30)
	# plot density
	plot(o)
 


