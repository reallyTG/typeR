library(phylosim)


### Name: getEventsAtSite.GeneralInsertor
### Title: Generate insertion event object given the state of the target
###   site
### Aliases: getEventsAtSite.GeneralInsertor
###   GeneralInsertor.getEventsAtSite
###   getEventsAtSite,GeneralInsertor-method

### ** Examples

	# create a sequence object
	s<-NucleotideSequence(string="AAAA")
	# create a GeneralInsertor process, provide template sequence.
	# propsed insert lengths:3, always accept.
	i<-GeneralInsertor(
		rate=0.5,
		template.seq=NucleotideSequence(string="GGG"),
		propose.by=function(process){3},
		accept.by=function(process,sequence,window){TRUE}
	)
	# attach process to site
	s$processes<-list(list(i));
	# set rate multiplier
	setRateMultipliers(s,i,2)
	# get the list of active events from site 2
	events<-getEventsAtSite(i,s$sites[[2]])
	events
	# set postition for event
	e<-events[[1]]
	e$.position<-2
	# print sequence
	s
	# perform event
	Perform(e)
	# check sequence again
	s
 


