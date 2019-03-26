library(phylosim)


### Name: setWriteProtected.Event
### Title: Set the write protection field for an object
### Aliases: setWriteProtected.Event Event.setWriteProtected
###   setWriteProtected,Event-method

### ** Examples


	# create an object
	o<-Event()
	# toggle write protection
	setWriteProtected(o,TRUE)
	# check write protection
	o$writeProtected
	# set write protection via virtual field
	o$writeProtected<-FALSE
	o$writeProtected


 


