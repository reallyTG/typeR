library(phylosim)


### Name: getParameterAtSite.Process
### Title: Get the value of a site-process specific paramter from a Site
###   object attached to a Process object
### Aliases: getParameterAtSite.Process Process.getParameterAtSite
###   getParameterAtSite,Process-method

### ** Examples

	# create a Site and a Process object
	a<-Alphabet()
	s<-Site(alphabet=a)
	p<-Process(alphabet=a)
	# attach the process
	attachProcess(s,p)
	# get the value of the rate multiplier
	getParameterAtSite(p,s,"rate.multiplier")
 


