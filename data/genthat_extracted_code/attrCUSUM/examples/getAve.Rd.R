library(attrCUSUM)


### Name: getAve
### Title: Compute ATSs and Other Informations on Attribute VSI CUSUM Chart
### Aliases: getAve

### ** Examples

# Example 1: Poisson distribution
getAve(refv = 5, contl = 8, c.zero = 0, warnl = 1, ds = 0.1,
       dl = NULL, di = NULL, process = function(x) dpois(x, lambda = 4),
       maxndec = 7L, maxnumsubI = 500L)



