library(BayesFactor)


### Name: BFBayesFactor-class
### Title: General S4 class for representing multiple Bayes factor model
###   comparisons, all against the same model
### Aliases: BFBayesFactor-class BFBayesFactorTop-class
###   /,numeric,BFBayesFactor-method /,BFBayesFactor,BFBayesFactor-method
###   [,BFBayesFactor,index,missing,missing-method t,BFBayesFactor-method
###   which.max,BFBayesFactor-method which.min,BFBayesFactor-method
###   is.na,BFBayesFactor-method *,BFBayesFactor,BFodds-method
###   [,BFBayesFactorTop,index,missing,missing-method

### ** Examples

## Compute some Bayes factors to demonstrate division and indexing
data(puzzles)
bfs <- anovaBF(RT ~ shape*color + ID, data = puzzles, whichRandom = "ID", progress=FALSE)

## First and second models can be separated; they remain BFBayesFactor objects
b1 = bfs[1]
b2 = bfs[2]
b1

## We can invert them, or divide them to obtain new model comparisons
1/b1
b1 / b2

## Use transpose to create a BFBayesFactorList
t(bfs)



