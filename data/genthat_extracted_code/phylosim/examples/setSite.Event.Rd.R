library(phylosim)


### Name: setSite.Event
### Title: Assotiate an Event object with a Site object
### Aliases: setSite.Event Event.setSite setSite,Event-method

### ** Examples

	# create an Event object
	e<-Event()
	# create some Site objects
	s1<-Site(alphabet=NucleotideAlphabet(),state="A")
	s2<-clone(s1); s2$state<-"T"
	# assotiate s1 with e
	setSite(e,s1)
	e$site
	# assotiate s2 with e via virtual field
	e$site<-s2
	e$site
 


