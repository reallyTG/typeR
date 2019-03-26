library(TESS)


### Name: tess.likelihood.rateshift
### Title: tess.likelihood.rateshift: Probability density of a tree under a
###   tree-wide time-dependent birth-death-shift process
### Aliases: tess.likelihood.rateshift
### Keywords: models htest

### ** Examples

# load a test data set
data(cettiidae)

# convert the phylogeny into the branching times
times <- as.numeric( branching.times(cettiidae) )

# construct speciation and extinction rate function that resemble the rate-shift
# any other function could be used too
l <- function(x) { if (x > 0.5 || x < 0.3) { return (1) } else { return (2) } }
e <- function(x) { if (x > 0.5 || x < 0.3) { return (0.95) } else { return (0.5) } }

# now compute the likelihood for the tree
tess.likelihood(times,l,e,MRCA=TRUE,log=TRUE)

# a second approach is the specific episodic birth-death process likelihood function
# we need to give the rates for each episode and the end time of the episodes
# you should see that both are equivalent in this setting
# the function approach is more general but also slower.
tess.likelihood.rateshift(times,
				lambda=c(2,1,2),
				mu=c(0.95,0.5,0.95),
				rateChangeTimesLambda=c(0.3,0.5),
				rateChangeTimesMu=c(0.3,0.5),
				MRCA=TRUE,
				log=TRUE)





