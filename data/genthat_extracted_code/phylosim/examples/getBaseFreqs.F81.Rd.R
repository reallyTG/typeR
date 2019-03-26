library(phylosim)


### Name: getBaseFreqs.F81
### Title: Get the base frequency parameters
### Aliases: getBaseFreqs.F81 F81.getBaseFreqs getBaseFreqs,F81-method

### ** Examples

	# construct a F81 object
	p<-F81()
	# set/get base frequency parameters
	setBaseFreqs(p,c(2,1,2,1)/6)
	getBaseFreqs(p)
	# set/get base frequency parameters via virtual field
	p$baseFreqs<-c(4,4,1,1)/10
	p$baseFreqs
	# get object summary
	summary(p)
 


