library(phylosim)


### Name: getBaseFreqs.GTR
### Title: Get the base frequency parameters
### Aliases: getBaseFreqs.GTR GTR.getBaseFreqs getBaseFreqs,GTR-method

### ** Examples

	# construct a GTR object
	p<-GTR()
	# set/get base frequency parameters
	setBaseFreqs(p,c(2,1,2,1)/6)
	getBaseFreqs(p)
	# set/get base frequency parameters via virtual field
	p$baseFreqs<-c(4,4,1,1)/10
	p$baseFreqs
	# get object summary
	summary(p)
 


