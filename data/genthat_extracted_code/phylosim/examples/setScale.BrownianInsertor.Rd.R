library(phylosim)


### Name: setScale.BrownianInsertor
### Title: Set scale parameter
### Aliases: setScale.BrownianInsertor BrownianInsertor.setScale
###   setScale,BrownianInsertor-method

### ** Examples

	# create a BrownianInsertor object
	p<-BrownianInsertor(scale=0.002)
	# set/get scale parameter
	setScale(p,0.1)
	getScale(p)
	# set/get scale parameter via virtual field
	p$scale<-0.1
	p$scale
 


