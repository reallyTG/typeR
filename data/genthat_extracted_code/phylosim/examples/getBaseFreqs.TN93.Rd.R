library(phylosim)


### Name: getBaseFreqs.TN93
### Title: Get the base frequency parameters
### Aliases: getBaseFreqs.TN93 TN93.getBaseFreqs getBaseFreqs,TN93-method

### ** Examples

	# construct a TN93 object
	p<-TN93()
	# set/get base frequency parameters
	setBaseFreqs(p,c(2,1,2,1)/6)
	getBaseFreqs(p)
	# set/get base frequency parameters via virtual field
	p$baseFreqs<-c(4,4,1,1)/10
	p$baseFreqs
	# get object summary
	summary(p)
 


