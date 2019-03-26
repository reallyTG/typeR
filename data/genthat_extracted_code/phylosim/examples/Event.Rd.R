library(phylosim)


### Name: Event
### Title: The Event class
### Aliases: Event

### ** Examples

	# Note: the following examples are not very useful
	# unless you want to implement your own process.

	# create a Sequence object and a Process object
	seq<-NucleotideSequence(string="A");
	p<-Process(alphabet=NucleotideAlphabet())
	# get the Site object from the Sequence object
	s<-seq$sites[[1]]
	# attach p to s
	attachProcess(s,p)
	# create an Event object
	e<-Event(name="A->G",rate=0.1,site=s,process=p,position=1)
	# get object summary
	summary(e)
	# get event name
	e$name
	# set/get event rate
	e$rate<-0.2
	e$rate
	# get site
	e$site
	# set/get event handler
	e$.handler<-function(this){this$.site$state<-"G"}
	e$handler
	# perform the event
	Perform(e)
	# check the state of the target site
	s$state
 


