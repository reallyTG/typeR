library(rjags)


### Name: parallel
### Title: Get initial values for parallel RNGs
### Aliases: parallel.seeds
### Keywords: models

### ** Examples

##The BaseRNG factory generates up to four distinct types of RNG. If
##more than 4 chains are requested, it will recycle the RNG types, but
##use different initial values
parallel.seeds("base::BaseRNG", 3)

## The lecuyer module provides the RngStream factory, which allows large
## numbers of independent parallel RNGs to be generated. 
load.module("lecuyer")
list.factories(type="rng")
parallel.seeds("lecuyer::RngStream", 5);



