library(DistatisR)


### Name: BootFromCompromise
### Title: Compute observation Bootstrap replicates of the factor scores
###   from bootstrapped compromises
### Aliases: BootFromCompromise
### Keywords: sample bootstrap

### ** Examples

# 1. Load the Sort data set from the SortingBeer example 
#    (available from the DistatisR package)
data(SortingBeer)
# Provide the "8 beers by 10 assessors" results of a sorting task
#-----------------------------------------------------------------------------
# 2. Create the set of distance matrices (one distance matrix per assessor)
#    (uses the function DistanceFromSort)
DistanceCube <- DistanceFromSort(Sort)

#-----------------------------------------------------------------------------
# 3. Call the distatis function with the cube of distance as parameter
testDistatis <- distatis(DistanceCube)
# The factor scores for the beers are in
# testDistatis$res4Splus$F
# the partial factor scores for the beers for the assessors are in 
#  testDistatis$res4Splus$PartialF
# 
# 4. Get the bootstraped factor scores (with default 1000 iterations)
#    Here we use the "total bootstrap"
 F_fullBoot <- BootFromCompromise(DistanceCube,niter=1000) 



