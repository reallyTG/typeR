library(phylosim)


### Name: getEventsAtSite.GeneralSubstitution
### Title: Generate the list of active Event objects for a given attached
###   Site object
### Aliases: getEventsAtSite.GeneralSubstitution
###   GeneralSubstitution.getEventsAtSite
###   getEventsAtSite,GeneralSubstitution-method

### ** Examples

	# create an Alphabet object
	a<-BinaryAlphabet()
	# create a Site object
	s<-Site(alphabet=a);
	# create a GeneralSubstitution object
	p<-GeneralSubstitution(alphabet=a,rate.list=list("0->1"=1,"1->0"=1))
	# attach process p to site object s
	attachProcess(s,p)
	# get the rate of active events
	getEventsAtSite(p,s)	# empty list
	# set the state of s
	s$state<-1;
	# get the rate of active events
	getEventsAtSite(p,s)
 


