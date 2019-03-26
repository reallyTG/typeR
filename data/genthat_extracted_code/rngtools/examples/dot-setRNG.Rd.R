library(rngtools)


### Name: .setRNG
### Title: Setting RNG Seeds
### Aliases: .setRNG .setRNG,character-method .setRNG,numeric-method

### ** Examples

# set RNG kind
old <- setRNG('Marsaglia')
# restore
setRNG(old)

# directly set .Random.seed
rng <- getRNG()
r <- runif(10)
setRNG(rng)
rng.equal(rng)

# initialise from a single number (<=> set.seed)
setRNG(123)
rng <- getRNG()
runif(10)
set.seed(123)
rng.equal(rng)




