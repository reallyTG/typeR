library(phylosim)


### Name: setAlphabet.Site
### Title: Attach an Alphabet object to a Site object
### Aliases: setAlphabet.Site Site.setAlphabet setAlphabet,Site-method

### ** Examples


	# create a site object
	s<-Site()
	# create an Alphabet object
	a<-Alphabet(c("A","T","G"))
	# attach alphabet to site object
	setAlphabet(s,a)
	# set site state
	s$state<-"A"
	# clone the alphabet object
	b<-clone(a)
	# modify symbol set in b
	b$symbols<-c(b$symbols,"C")
	# attach b to s via virtual field
	s$alphabet<-b
	s$alphabet
 


