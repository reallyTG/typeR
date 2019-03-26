library(phylosim)


### Name: setState.Site
### Title: Set the state of a Site object
### Aliases: setState.Site Site.setState setState,Site-method

### ** Examples


       # create a Site object with an Alphabet object attached
       s<-Site(alphabet=Alphabet(symbols=c(0,1)), state=1);
       # set a new state
       setState(s,"0")
       # get state via virtual field
       s$state
       # set a new state via virtual field
       s$state<-1
	s$state

 


