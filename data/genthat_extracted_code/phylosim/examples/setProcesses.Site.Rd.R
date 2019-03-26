library(phylosim)


### Name: setProcesses.Site
### Title: Specify the list of Process objects attached to a Site object
### Aliases: setProcesses.Site Site.setProcesses setProcesses,Site-method

### ** Examples

	# create a Site object
	s<-Site(alphabet=NucleotideAlphabet())
	# create some processes
	p1<-JC69(); p2<-K80(); p3<-DiscreteInsertor(rate=1);
	# attach the processes
	setProcesses(s,list(p1,p2,p3))
	# attach one more process via virtual field
	s$processes<-c(s$processes,list(GTR()))
	# get the list of attached processes
	s$processes
	# detach all processes via virtual field
	s$processes<-list()
	s$processes
 


