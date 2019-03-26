library(shock)


### Name: computeLoglikeFromPartition
### Title: Compute the log-likelihood of the model
### Aliases: computeLoglikeFromPartition

### ** Examples

## load data to test
 data(dataTest)
 
## threshold of absS matrix
myLABELS <- thresholdAbsSPath(dataTest)$partitionList

## compute loglikelihood 
logLikePath <- lapply(myLABELS, function(x) computeLoglikeFromPartition(x,dataTest))




