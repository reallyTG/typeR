library(CEGO)


### Name: optimEA
### Title: Evolutionary Algorithm for Combinatorial Optimization
### Aliases: optimEA

### ** Examples

seed=0
#distance
dF <- distancePermutationHamming
#mutation
mF <- mutationPermutationSwap
#recombination
rF <-  recombinationPermutationCycleCrossover 
#creation
cF <- function()sample(5)
#objective function
lF <- landscapeGeneratorUNI(1:5,dF)
#start optimization
set.seed(seed)
res <- optimEA(,lF,list(creationFunction=cF,mutationFunction=mF,recombinationFunction=rF,
	popsize=6,budget=60,targetY=0,verbosity=1,
	vectorized=TRUE)) ##target function is "vectorized", expects list as input
res$xbest 




