library(phylosim)


### Name: GeneralDeletor
### Title: The GeneralDeletor class
### Aliases: GeneralDeletor

### ** Examples

 	# create a GeneralDeletor object
       # proposed deletion length: 4, always accept
       d<-GeneralDeletor(
                       name = "DEL",
                       rate = 1,
                       propose.by=function(process, sequence, position){ 4 },
                       accept.by=function(process, sequence, range){ TRUE }
       )
	d
	# check if object inherits from GeneralDeletor
	is.GeneralDeletor(d)
	# get object summary
	summary(d)
	# set/get name
	d$name<-"Del Bosque"
	d$name
	# set/get rate
	d$rate<-0.5
	d$rate
	# set/get proposeBy
	# propose deletion lengths between 3 and 6
	d$proposeBy<-function(process, sequence, position){ sample(3:6,1) }
	d$proposeBy
	# set/get acceptBy
   # reject half of the events
	d$acceptBy<-function(process, sequence, range){ sample(c(TRUE, FALSE), 1)}
	d$acceptBy
	# create a sequence object, attach process
	s<-NucleotideSequence(string="AATTGGCCCCGGTTAA", processes=list(list(d)))
	# set the rate multiplier
       setRateMultipliers(s,d,2)
       # get the list of active events at site 6
       events<-getEventsAtSite(d,s$sites[[6]])
       events;
       # print sequence
       s
       # set the position for the event object
       e<-events[[1]];
       e$.position<-6;
       # perform the deletion event
       Perform(e)
       # check the results
       s
 


