library(TESS)


### Name: tess.nTaxa.expected
### Title: tess.nTaxa.expected: The expected number of taxa at present of a
###   tree under a global, time-dependent birth-death process ( E[ N(T) ] )
### Aliases: tess.nTaxa.expected
### Keywords: models

### ** Examples


# create the time-dependent speciation and extinction rate functions
# here we use episodic functions
l <- function(x) { if (x > 0.5 || x < 0.3) { return (1) } else { return (2) } }
e <- function(x) { if (x > 0.5 || x < 0.3) { return (0.95) } else { return (0.5) } }

# now we can compute the expected number of taxa at time t
# note that we compute here the actual diversity at time t
# if you set reconstructed=TRUE, then you get the expected
# number of lineages that will survive until the present
tess.nTaxa.expected(begin=0,t=2,end=5,l,e,MRCA=TRUE)





