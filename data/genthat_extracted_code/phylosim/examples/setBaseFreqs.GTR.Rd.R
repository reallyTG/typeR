library(phylosim)


### Name: setBaseFreqs.GTR
### Title: Set the base frequency parameters
### Aliases: setBaseFreqs.GTR GTR.setBaseFreqs setBaseFreqs,GTR-method

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
 


