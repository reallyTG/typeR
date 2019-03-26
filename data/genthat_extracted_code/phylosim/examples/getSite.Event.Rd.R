library(phylosim)


### Name: getSite.Event
### Title: Get the Site object associated with an Event object
### Aliases: getSite.Event Event.getSite getSite,Event-method

### ** Examples

	# create a sequence and attach a process
	s<-NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	# get the first active event from the first site
	e<-s$sites[[1]]$events[[1]]
	# get the site associated with e
	getSite(e)
	# get site via virtual field
	e$site
 


