library(phylosim)


### Name: getEventsAtSite.Process
### Title: Generate the list of active Event objects given a Site object
### Aliases: getEventsAtSite.Process Process.getEventsAtSite
###   getEventsAtSite,Process-method

### ** Examples

	# create objects
	a<-NucleotideAlphabet()
	p<-Process(alphabet=a)
	s<-Site(alphabet=a)
	# attach Process p to Site s
	s$processes<-list(p)
	# get active Event objects (empty list)
	getEventsAtSite(p,s)

 


