library(phylosim)


### Name: setSizes.DiscreteDeletor
### Title: Set the sizes of the proposed deletions
### Aliases: setSizes.DiscreteDeletor DiscreteDeletor.setSizes
###   setSizes,DiscreteDeletor-method

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
 


