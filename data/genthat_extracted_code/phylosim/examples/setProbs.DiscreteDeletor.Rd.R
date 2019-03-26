library(phylosim)


### Name: setProbs.DiscreteDeletor
### Title: Set the deletion length probabilities
### Aliases: setProbs.DiscreteDeletor DiscreteDeletor.setProbs
###   setProbs,DiscreteDeletor-method

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
 


