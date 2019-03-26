library(phylosim)


### Name: detachProcess.Site
### Title: Site
### Aliases: detachProcess.Site Site.detachProcess
###   detachProcess,Site-method

### ** Examples

	# create a Site objects and attach some processes
	s<-Site()
	s$alphabet<-NucleotideAlphabet()
	p1<-JC69(); p2<-K80()
	attachProcess(s,p1)
	attachProcess(s,p2)
	# get the list of attached processes
	s$processes
	# detach p1
	detachProcess(s,p1)
	s$processes
 


