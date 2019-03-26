library(phylosim)


### Name: isAttached.Site
### Title: Check whether a Process object is attached to a Site object
### Aliases: isAttached.Site Site.isAttached isAttached,Site-method

### ** Examples

	# create a Site object
	s<-Site(alphabet=NucleotideAlphabet())
	# create a Process object
	p<-JC69()
	# check if p is attached to s
	isAttached(s,p)
	# attach p to s
	s$processes<-list(p)
	isAttached(s,p)
 


