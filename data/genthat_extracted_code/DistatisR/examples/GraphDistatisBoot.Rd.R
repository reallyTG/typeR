library(DistatisR)


### Name: GraphDistatisBoot
### Title: Plot maps of the factor scores of the observations and their
###   bootstrapped confidence intervals (as confidence ellipsoids or peeled
###   hulls) for a DISTATIS analysis.
### Aliases: GraphDistatisBoot
### Keywords: DistatisR

### ** Examples

# 1. Load the Sort data set from the SortingBeer example  (available from the DistatisR package)
data(SortingBeer)
# Provide an 8 beers by 10 assessors results of a sorting task
#-----------------------------------------------------------------------------
# 2. Create the set of distance matrices (one distance matrix per assessor)
#    (ues the function DistanceFromSort)
DistanceCube <- DistanceFromSort(Sort)

#-----------------------------------------------------------------------------
# 3. Call the DISTATIS routine with the cube of distance as parameter
testDistatis <- distatis(DistanceCube)
# The factor scores for the beers are in
# testDistatis$res4Splus$F
# the partial factor score for the beers for the assessors are in 
#  testDistatis$res4Splus$PartialF
# 
# 4. Get the bootstraped factor scores (with default 1000 iterations)
BootF <- BootFactorScores(testDistatis$res4Splus$PartialF)
#-----------------------------------------------------------------------------
# 5. Create the Graphics with GraphDistatisBoot
#
GraphDistatisBoot(testDistatis$res4Splus$F,BootF)




