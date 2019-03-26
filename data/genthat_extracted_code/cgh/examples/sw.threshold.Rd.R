library(cgh)


### Name: sw.threshold
### Title: Threshold function
### Aliases: sw.threshold
### Keywords: misc

### ** Examples

## simluate vector of logratios
set.seed(3)
logratio <- c(rnorm(20) - 1, rnorm(20))

## invert sign of values and subtract threshold to ensure negative mean
x <- sw.threshold(logratio, function(x) median(x) + .2 * mad(x), sign = -1)

## perform Smith-Waterman algorithm
sw(x, trace = TRUE)
  


