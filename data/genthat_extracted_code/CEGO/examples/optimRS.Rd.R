library(CEGO)


### Name: optimRS
### Title: Combinatorial Random Search
### Aliases: optimRS

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
res <- optimRS(,lF,list(creationFunction=cF,budget=100,
	vectorized=TRUE)) ##target function is "vectorized", expects list as input
res$xbest 




