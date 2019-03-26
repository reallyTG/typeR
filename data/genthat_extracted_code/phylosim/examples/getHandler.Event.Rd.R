library(phylosim)


### Name: getHandler.Event
### Title: Get the handler function of an Event object
### Aliases: getHandler.Event Event.getHandler getHandler,Event-method

### ** Examples

	# create a sequence and attach a process
	s<-NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	# get the first active event from the first site
   # only Sequence methods set .position,
   # so s$sites[[1]]$events[[1]] wouldn't work.
	e<-getEvents(s,1)[[1]]
	# het the handler of e
	getHandler(e)
 


