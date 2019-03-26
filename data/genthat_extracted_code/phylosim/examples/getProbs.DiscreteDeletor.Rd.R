library(phylosim)


### Name: getProbs.DiscreteDeletor
### Title: Get the deletion length probabilities
### Aliases: getProbs.DiscreteDeletor DiscreteDeletor.getProbs
###   getProbs,DiscreteDeletor-method

### ** Examples

	# create a DiscreteDeletor object
	d<-DiscreteDeletor(rate=1, sizes=1:3)
	# set/get length probabilities
	setProbs(d,c(1/3,1/3,1/3)) # equal probabilites
	getProbs(d)
	# set/get length probabilities via virtual field
	x<-c(2,2,1)
	# normalize x
	x<-x/sum(x)
	d$probs<-x
	d$probs
 


