library(phylosim)


### Name: as.character.Event
### Title: Get the character representation of an Event object
### Aliases: as.character.Event Event.as.character
###   as.character,Event-method

### ** Examples

	# create a sequence and attach a process
	s<-NucleotideSequence(string="ATGC",processes=list(list(JC69())))
	# get the first active event from the first site
	e<-s$sites[[1]]$events[[1]]
	# get the character representation of e
	as.character(e)
	# or more simply
	e
 


