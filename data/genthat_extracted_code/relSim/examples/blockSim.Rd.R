library(relSim)


### Name: blockSim
### Title: Perform relatives simulations using large memory blocks in C
### Aliases: blockSim

### ** Examples


## not run
## this counts the number of unrelated pairs that are falsely identified
## as siblings using the policy that there are 16 or more matching
## alleles, and the LR/KI is greater than 100,000
## this is a very rare event for the FBI Caucasians with a frequency of
## about 4-5 times in 10 million pairs
## Not run: 
##D data(fbiCaucs)
##D N = 1e8
##D ki = 1e5
##D ibs = 16
##D code = 5
##D BlockSize = 1e6
##D blockSim(N, fbiCaucs, rel = "UN", ibsthresh = ibs, kithresh = ki,
##D          code = code, falseNeg = FALSE, BlockSize = BlockSize)
## End(Not run)



