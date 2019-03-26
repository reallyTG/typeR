library(treespace)


### Name: multiDist
### Title: Metric function for 'multiPhylo' input
### Aliases: multiDist

### ** Examples


## generate 10 random trees, each with 6 tips
trees <- rmtree(10,6)

## pairwise distance matrix when lambda=0
multiDist(trees)

## pairwise distance matrix as a function of lambda:
m <- multiDist(trees, return.lambda.function=TRUE)

## evaluate at lambda=0. Equivalent to multiDist(trees).
m0 <- m(0)

## save memory by recomputing each tree vector for each pairwise tree comparison (for fixed lambda):
m0.5 <- multiDist(trees,0.5,save.memory=TRUE)





