library(phylosim)


### Name: getEvents.Site
### Title: Get the list of active event objects given the current state of
###   the Site object
### Aliases: getEvents.Site Site.getEvents getEvents,Site-method

### ** Examples

	# create a site object with a JC69 substitution process attached
	s<-Site(alphabet=NucleotideAlphabet(), state="A",processes=list(JC69()))
	# get the list of active event objects
	getEvents(s)
	# modify site state
	s$state<-"T"
	# get the list of active event objects via virtual field
	s$events

 


