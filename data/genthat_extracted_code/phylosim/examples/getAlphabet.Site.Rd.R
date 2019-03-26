library(phylosim)


### Name: getAlphabet.Site
### Title: Get the Alphabet object attached to a Site object
### Aliases: getAlphabet.Site Site.getAlphabet getAlphabet,Site-method

### ** Examples


	# create a site object
	s<-Site()
	# create an Alphabet object
	a<-Alphabet(c("A","T","G"))
	# attach alphabet to site object
	setAlphabet(s,a)
	# get attached alphabet
	getAlphabet(s)
	# get attached alphabet via virtual field
	s$alphabet
 


