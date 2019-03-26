library(phylosim)


### Name: setPosition.Event
### Title: Set the position of the Site object associated to an Event
###   object
### Aliases: setPosition.Event Event.setPosition setPosition,Event-method

### ** Examples

	# Note: the following example is not too useful

	# create a sequence and attach a process
	s<-NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	# get the first active event from the first site
	e<-getEvents(s,1)[[1]]
	# get event position
	e$position
	# set the position of the site associated with e
	setPosition(e,2)
	# get position via virtual field
	e$position
	# set position via virtual field
	e$position<-1
	e$position
 


