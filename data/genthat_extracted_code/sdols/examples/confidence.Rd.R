library(sdols)


### Name: confidence
### Title: Compute Clustering Confidence
### Aliases: confidence

### ** Examples

## No test: 

probabilities <- expectedPairwiseAllocationMatrix(iris.clusterings)
clustering <- salso(probabilities)
conf <- confidence(clustering,probabilities)
conf

## Don't show: 
rscala::scalaDisconnect(sdols:::s)
## End(Don't show)
## End(No test)




