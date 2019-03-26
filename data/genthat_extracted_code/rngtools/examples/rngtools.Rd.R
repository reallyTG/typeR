library(rngtools)


### Name: rngtools
### Title: Utility functions for working with Random Number Generators
### Aliases: rngtools rngtools-package

### ** Examples


showRNG()
s <- getRNG()
RNGstr(s)
RNGtype(s)

# get what would be the RNG seed after set.seed
s <- nextRNG(1234)
showRNG(s)
showRNG( nextRNG(1234, ndraw=10) )

# change of RNG kind
showRNG()
k <- RNGkind()
k[2L] <- 'Ahrens'
try( RNGkind(k) )
setRNG(k)
showRNG()
# set encoded kind 
setRNG(501L)
showRNG()

# use as set seed
setRNG(1234)
showRNG()
r <- getRNG()

# extract embedded RNG specifications
runif(10)
setRNG(list(1, rng=1234))
rng.equal(r)

# restore default RNG (e.g., after errors)
RNGrecovery()
showRNG()




