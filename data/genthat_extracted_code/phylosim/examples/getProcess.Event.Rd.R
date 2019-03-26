library(phylosim)


### Name: getProcess.Event
### Title: Get the Process object which generated an Event object
### Aliases: getProcess.Event Event.getProcess getProcess,Event-method

### ** Examples

	# create a sequence and attach a process
	s<-NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	# get the first active event from the first site
	e<-s$sites[[1]]$events[[1]]
	# get the generator process for e
	e$process
 


