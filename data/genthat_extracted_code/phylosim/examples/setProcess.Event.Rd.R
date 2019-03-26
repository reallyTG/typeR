library(phylosim)


### Name: setProcess.Event
### Title: Set the generator process for an Event object
### Aliases: setProcess.Event Event.setProcess setProcess,Event-method

### ** Examples

	# create an Event object
	e<-Event()
	# set a generator process for e
	setProcess(e,Process())
	# get generator process
	e$process
	# set process via virtual field
	e$process<-K80()
	e$process
 


