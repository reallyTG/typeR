library(cgh)


### Name: sw.plot
### Title: Plot Results of Smith-Waterman Algorithm
### Aliases: sw.plot
### Keywords: misc

### ** Examples

## simluate vector of logratios
set.seed(3)
logratio <- c(rnorm(20) - 1, rnorm(20))

## invert sign of values and subtract threshold to ensure negative mean
x <- sw.threshold(logratio, function(x) median(x) + .2 * mad(x), -1)

## perform permuation test for islands identified
p <- sw.perm.test(x, max.nIslands = NULL, nIter = 1e4)

## calculate robustness scores
r <- sw.rob(x)

## plot results
sw.plot(logratio, seq(length(logratio)),
  function(x) median(x) + .2 * mad(x), sign = -1, rob = r,
  main = paste("Toy dataset, highest-scoring island p =", p[1]))
  


