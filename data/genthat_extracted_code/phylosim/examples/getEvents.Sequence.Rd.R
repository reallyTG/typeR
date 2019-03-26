library(phylosim)


### Name: getEvents.Sequence
### Title: Get the list of active Event objects for a set of Site objects
###   aggregated by a Sequence object
### Aliases: getEvents.Sequence Sequence.getEvents
###   getEvents,Sequence-method

### ** Examples

	# create a sequence with a process attached
	s<-Sequence(
               string="ATGC",
               alphabets=list(NucleotideAlphabet()),
               processes=list(list(JC69()))
               )
	# get the active events from range 1:3
	getEvents(s,1:3)
	# get all active events via virtual field
	s$events
 


