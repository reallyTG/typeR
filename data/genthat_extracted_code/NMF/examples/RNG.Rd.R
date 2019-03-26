library(NMF)


### Name: getRNG1
### Title: Extracting RNG Data from NMF Objects
### Aliases: .getRNG getRNG1 getRNG1-methods getRNG1,NMFfitX1-method
###   getRNG1,NMFfitX-method getRNG1,NMFfitXn-method .getRNG-methods
###   .getRNG,NMFfitXn-method
### Keywords: methods

### ** Examples

## Don't show: 
# roxygen generated flag
options(R_CHECK_RUNNING_EXAMPLES_=TRUE)
## End(Don't show)

# For multiple NMF runs, the RNG settings used for the first run is also stored
V <- rmatrix(20,10)
res <- nmf(V, 3, nrun=4)
# RNG used for the best fit
getRNG(res)
# RNG used for the first of all fits
getRNG1(res)
# they may differ if the best fit is not the first one
rng.equal(res, getRNG1(res))



