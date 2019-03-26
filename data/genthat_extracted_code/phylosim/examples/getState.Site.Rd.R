library(phylosim)


### Name: getState.Site
### Title: Get the current state of a Site object
### Aliases: getState.Site Site.getState getState,Site-method

### ** Examples


	# create a Site object with an Alphabet object attached
	s<-Site(alphabet=Alphabet(symbols=c(0,1)), state=1);
	# get current state
	getState(s)
	# get state via virtual field
	s$state

 


