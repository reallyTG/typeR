library(phylosim)


### Name: plot.ContinuousDeletor
### Title: Plot the density of proposed lengths
### Aliases: plot.ContinuousDeletor ContinuousDeletor.plot
###   plot,ContinuousDeletor-method

### ** Examples

	# create object
	o<-ContinuousDeletor(rate=1)
	# set length sampling expression via virtual field
	o$dist<-expression(rnorm(1,mean=10,sd=4))
	# set maxLength
	setMaxLength(o, 30)
	# plot density
	plot(o)
 


