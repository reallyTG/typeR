library(phylosim)


### Name: Perform.Event
### Title: Perform an event
### Aliases: Perform.Event Event.Perform Perform,Event-method

### ** Examples

	# create a sequence and attach a process
	s<-NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	# get the first active event from the first site
   #only Sequence methods set .position,
   #so s$sites[[1]]$events[[1]] wouldn't work.
	e<-getEvents(s,1)[[1]]
	# perform e
	Perform(e)
	# check the effect of the event on s
	s
 


