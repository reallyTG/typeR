library(phylosim)


### Name: setTheta.T92
### Title: Set the GC content
### Aliases: setTheta.T92 T92.setTheta setTheta,T92-method

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
 


