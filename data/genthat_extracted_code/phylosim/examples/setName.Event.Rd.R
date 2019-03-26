library(phylosim)


### Name: setName.Event
### Title: Set the name of an Event object
### Aliases: setName.Event Event.setName setName,Event-method

### ** Examples

	# create an Event object
	e<-Event()
	# set event name
	setName(e,"Insertion")
	# get event name
	e$name
	# set name via virtual field
	e$name<-"Deletion"
	e$name
 


