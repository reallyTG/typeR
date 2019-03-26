library(phylosim)


### Name: getAncestral.Site
### Title: Get the ancestral object of a Site object
### Aliases: getAncestral.Site Site.getAncestral getAncestral,Site-method

### ** Examples

	a<-Alphabet();
	# create some site object
	s1<-Site(alphabet=a)
	s2<-Site(ancestral=s1, alphabet=a)
	# get ancestral objects
	getAncestral(s1)
	s2$ancestral
 


