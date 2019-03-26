library(phylosim)


### Name: getSizes.DiscreteDeletor
### Title: Get the sizes of the proposed deletions
### Aliases: getSizes.DiscreteDeletor DiscreteDeletor.getSizes
###   getSizes,DiscreteDeletor-method

### ** Examples

	# create a DiscreteDeletor object
	d<-DiscreteDeletor(rate=1)
	# set deletion sizes    
	setSizes(d,c(1,2,3))
	# get deletion sizes
	getSizes(d)
	# set/get sizes via virtual field
	d$sizes<-1:10
	d$sizes
 


