library(phylosim)


### Name: getProcesses.Site
### Title: Get the list of Process objects attached to a Site object
### Aliases: getProcesses.Site Site.getProcesses getProcesses,Site-method

### ** Examples

	# create a Site object with some processes attached
	s<-Site(alphabet=NucleotideAlphabet(),processes=list(K80(),JC69()))
	# get list of attached Process objects
	getProcesses(s)
	# get list of attached Process objects via virtual field
	s$processes
 


