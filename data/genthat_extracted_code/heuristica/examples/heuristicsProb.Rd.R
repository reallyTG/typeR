library(heuristica)


### Name: heuristicsProb
### Title: Wrap fitted heuristics to pass to rowPairApply to call
###   predictProb.
### Aliases: heuristicsProb

### ** Examples

## This is typical usage:
data <- cbind(y=c(30,20,10,5), x1=c(1,1,0,0), x2=c(1,1,0,1))
ttb <- ttbModel(data, 1, c(2:ncol(data)))
rowPairApply(data, heuristicsProb(ttb))
## This outputs ttb's predictions for all 6 row pairs of data.
## (It has 6 row pairs because 4*2/2 = 6.)  It gets the predictions
## by calling ttb's predictProbInternal.




