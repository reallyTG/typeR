library(phylosim)


### Name: setParameterAtSite.Process
### Title: Set the value of a site-process specific paramter in a Site
###   object attached to a Process object
### Aliases: setParameterAtSite.Process Process.setParameterAtSite
###   setParameterAtSite,Process-method setParameterAtSite.FastFieldDeletor

### ** Examples

	# create a Site and a Process object
	a<-BinaryAlphabet()
	s<-Site(alphabet=a)
	p<-Process(alphabet=a)
	# attach the process
	attachProcess(s,p)
	# set the value of the rate multiplier
	setParameterAtSite(p,s,"rate.multiplier",2)
	# get the value of the rate multiplier
	getParameterAtSite(p,s,"rate.multiplier")
 


