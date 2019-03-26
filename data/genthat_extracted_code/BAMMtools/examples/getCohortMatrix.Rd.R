library(BAMMtools)


### Name: getCohortMatrix
### Title: Compute the pairwise correlation in rate regimes between all
###   tips in a 'bammdata' object
### Aliases: getCohortMatrix
### Keywords: models

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, nsamples=500)

cormat <- getCohortMatrix(ed)

dim(cormat)
hist(cormat, breaks=50)



