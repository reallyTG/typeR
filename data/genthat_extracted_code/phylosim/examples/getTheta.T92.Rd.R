library(phylosim)


### Name: getTheta.T92
### Title: Get the GC content
### Aliases: getTheta.T92 T92.getTheta getTheta,T92-method

### ** Examples

       # construct a T92 object
       p<-T92()
       # set/get GC content
	setTheta(p,0.6)
	getTheta(p)
	# set/get GC content via virtual field
	p$theta<-0.3
	p$theta
	# get object summary
	summary(p)
 


