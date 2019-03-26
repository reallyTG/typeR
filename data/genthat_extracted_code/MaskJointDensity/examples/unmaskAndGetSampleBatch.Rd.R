library(MaskJointDensity)


### Name: unmaskAndGetSampleBatch
### Title: Batch function that allows the user to unmask a number of
###   variables as well as to sample from the estimated joint density
###   function.  Serves as a wrapper for the first and second functions the
###   End-User calls to obtain the samples from the marginal distributions
###   of the unmasked data.
### Aliases: unmaskAndGetSampleBatch
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

##outputNL1 <- unmaskAndGetSampleBatch(listOfMaskedVectorsToBeUnmasked = ##list(ystar1, ystar2),
##                                    listOfNoisefiles = 
## (file.path(tempdir(),"noise1.bin"),file.path(tempdir(),"noise2.bin")),
##                                    cores = 1, size = 1000,
##                                    verbose = 2)
## not a real example because ultimately in order to demonstrate this
## function the entire package functionality must be demonstrated
## this is demonstrated in the package example



