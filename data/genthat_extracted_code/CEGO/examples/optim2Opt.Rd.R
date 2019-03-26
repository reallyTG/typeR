library(CEGO)


### Name: optim2Opt
### Title: Two-Opt
### Aliases: optim2Opt

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
res <- optim2Opt(,lF,list(creationFunction=cF,budget=100,
   vectorized=TRUE)) ##target function is "vectorized", expects list of solutions as input
res




