library(rngtools)


### Name: RNGseed
### Title: Directly Getting or Setting the RNG Seed
### Aliases: RNGseed RNGrecovery

### ** Examples

#--- RNGseed ---

# get current seed
RNGseed()
# directly set seed
old <- RNGseed(c(401L, 1L, 1L))
# show old/new seed description
showRNG(old)
showRNG()

# set bad seed
RNGseed(2:3)
try( showRNG() )
# recover from bad state
RNGrecovery()
showRNG()

# example of backup/restore of RNG in functions
f <- function(){
	orng <- RNGseed()
 on.exit(RNGseed(orng))
	RNGkind('Marsaglia')
	runif(10)
}

sample(NA)
s <- .Random.seed
f()
identical(s, .Random.seed)
## Don't show: 
 stopifnot(identical(s, .Random.seed)) 
## End(Don't show)





