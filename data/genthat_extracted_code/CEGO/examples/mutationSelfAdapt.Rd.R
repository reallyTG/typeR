library(CEGO)


### Name: mutationSelfAdapt
### Title: Self-adaptive mutation operator
### Aliases: mutationSelfAdapt

### ** Examples

seed=0
N=5
require(ParamHelpers)
#distance
dF <- distancePermutationHamming
#mutation
mFs <- c(mutationPermutationSwap,mutationPermutationInterchange,
mutationPermutationInsert,mutationPermutationReversal)
rFs <- c(recombinationPermutationCycleCrossover,recombinationPermutationOrderCrossover1,
recombinationPermutationPositionBased,recombinationPermutationAlternatingPosition)
mF <- mutationSelfAdapt
selfAdaptiveParameters <- makeParamSet(
	makeNumericParam("mutationRate", lower=1/N,upper=1, default=1/N),
	makeDiscreteParam("mutationOperator", values=1:4, default=expression(sample(4,1))), 
#1: swap, 2: interchange, 3: insert, 4: reversal mutation
makeDiscreteParam("recombinationOperator", values=1:4, default=expression(sample(4,1))) 
#1: CycleX, 2: OrderX, 3: PositionX, 4: AlternatingPosition
)
#recombination
rF <-  recombinationSelfAdapt	 
#creation
cF <- function()sample(N)
#objective function
lF <- landscapeGeneratorUNI(1:N,dF)
#start optimization
set.seed(seed)
res <- optimEA(,lF,list(parameters=list(mutationFunctions=mFs,recombinationFunctions=rFs),
	creationFunction=cF,mutationFunction=mF,recombinationFunction=rF,
	popsize=15,budget=100,targetY=0,verbosity=1,selfAdaption=selfAdaptiveParameters,
	vectorized=TRUE)) ##target function is "vectorized", expects list as input
res$xbest 



