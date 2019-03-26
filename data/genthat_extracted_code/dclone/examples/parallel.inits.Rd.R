library(dclone)


### Name: parallel.inits
### Title: Parallel RNGs for initial values
### Aliases: parallel.inits
### Keywords: utilities

### ** Examples

if (require(rjags)) {
## "base::BaseRNG" factory.
parallel.inits(NULL, 2)
## "lecuyer::RngStream" factory
load.module("lecuyer")
parallel.inits(NULL, 2)
unload.module("lecuyer")
## some non NULL inits specifications
parallel.inits(list(a=0), 2)
parallel.inits(list(list(a=0), list(a=0)), 2)
parallel.inits(function() list(a=0), 2)
parallel.inits(function(chain) list(a=chain), 2)
}



