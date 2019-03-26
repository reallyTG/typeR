library(cgh)


### Name: sw.perm.test
### Title: Permutation Test for Smith-Waterman Algorithm
### Aliases: sw.perm.test
### Keywords: misc

### ** Examples

## simluate vector of logratios
set.seed(3)
logratio <- c(rnorm(20) - 1, rnorm(20))

## invert sign of values and subtract threshold to ensure negative mean
x <- sw.threshold(logratio, function(x) median(x) + .2 * mad(x), -1)

## perform Smith-Waterman
sw(x)

## perform permutation test on the islands identified
sw.perm.test(x, max.nIslands = NULL, nIter= 1e4)
  


