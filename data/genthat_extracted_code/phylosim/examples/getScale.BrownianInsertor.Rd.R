library(phylosim)


### Name: getScale.BrownianInsertor
### Title: Get scale parameter
### Aliases: getScale.BrownianInsertor BrownianInsertor.getScale
###   getScale,BrownianInsertor-method

### ** Examples

	# create a BrownianInsertor object
	p<-BrownianInsertor(scale=0.002)
	# set/get scale parameter
	setScale(p,0.1)
	getScale(p)
	# set/get scale parameter via virtual field
	p$scale<-0.1
	p$scale
 


