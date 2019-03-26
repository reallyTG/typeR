library(phylosim)


### Name: getPosition.Event
### Title: Get the position of the Site object associated to an Event
###   object in the enclosing Sequence object
### Aliases: getPosition.Event Event.getPosition getPosition,Event-method

### ** Examples

	# create a sequence and attach a process
	s<-NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	# get the first active event from the first site
	e<-getEvents(s,1)[[1]]
	# get the position of the site associated with e
	getPosition(e)
	# get position via virtual field
	e$position
 


