library(lagged)


### Name: [[-methods
### Title: Methods for '[[' in package 'lagged'
### Aliases: [[-methods [[,Lagged,numeric-method
### Keywords: methods

### ** Examples

## for 1d objects the difference of '[' and '[[' is not visible
(acv1 <- acf2Lagged(acf(ldeaths, plot = FALSE)))
acv1[1]
acv1[[1]]

## in higher dimenions it matters
acv2 <- acf2Lagged(acf(ts.union(mdeaths, fdeaths), plot = FALSE))
acv2[0]   # array
acv2[[0]] # matrix

## as in standard R conventions, '[' can select arbitrary number of elements
acv2[0:1]
## ... while '[[' selects only one, so this is an error:
## Not run: 
##D acv2[[0:1]]
## End(Not run)



