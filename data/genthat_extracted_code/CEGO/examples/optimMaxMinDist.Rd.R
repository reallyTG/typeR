library(CEGO)


### Name: optimMaxMinDist
### Title: Max-Min-Distance Optimizer
### Aliases: optimMaxMinDist

### ** Examples

seed=0
#distance
dF <- distancePermutationHamming
#creation
cF <- function()sample(5)
#objective function
lF <- landscapeGeneratorUNI(1:5,dF)
#start optimization
set.seed(seed)
res <- optimMaxMinDist(,lF,list(creationFunction=cF,budget=20,
	vectorized=TRUE)) ##target function is "vectorized", expects list as input
res$xbest 




