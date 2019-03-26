library(BayesFactor)


### Name: BFBayesFactorList-class
### Title: General S4 class for representing a collection of Bayes factor
###   model comprisons, each against a different denominator
### Aliases: BFBayesFactorList-class t,BFBayesFactorList-method
###   /,numeric,BFBayesFactorList-method
###   [,BFBayesFactorList,index,index,missing-method
###   [,BFBayesFactorList,index,missing,missing-method
###   [,BFBayesFactorList,missing,index,missing-method

### ** Examples

## Compute some Bayes factors to demonstrate Bayes factor lists
data(puzzles)
bfs <- anovaBF(RT ~ shape*color + ID, data = puzzles, whichRandom = "ID", progress=FALSE)

## Create a matrix of Bayes factors
bfList <- bfs / bfs
bfList

## Use indexing to select parts of the 'matrix'
bfList[1,]
bfList[,1]

## We can use the t (transpose) function as well, to get back a BFBayesFactor
t(bfList[2,])

## Or transpose the whole matrix
t(bfList)



