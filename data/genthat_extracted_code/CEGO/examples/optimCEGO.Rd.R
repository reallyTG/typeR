library(CEGO)


### Name: optimCEGO
### Title: Combinatorial Efficient Global Optimization
### Aliases: optimCEGO

### ** Examples

seed <- 0
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
res1 <- optimCEGO(,lF,list(
			creationFunction=cF,
			distanceFunction=dF,
			optimizerSettings=list(budget=100,popsize=10,
			mutationFunction=mF,recombinationFunction=rF),
	evalInit=5,budget=15,targetY=0,verbosity=1,model=modelKriging,
	vectorized=TRUE)) ##target function is "vectorized", expects list as input
set.seed(seed)
res2 <- optimCEGO(,lF,list(
			creationFunction=cF,
			distanceFunction=dF,
			optimizerSettings=list(budget=100,popsize=10,
			mutationFunction=mF,recombinationFunction=rF),
			evalInit=5,budget=15,targetY=0,verbosity=1,model=modelRBFN,
	vectorized=TRUE)) ##target function is "vectorized", expects list as input
res1$xbest 
res2$xbest 




