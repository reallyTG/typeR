library(sdols)


### Name: expectedPairwiseAllocationMatrix
### Title: Compute Expected Pairwise Allocation Matrix
### Aliases: expectedPairwiseAllocationMatrix

### ** Examples

## No test: 

probabilities <- expectedPairwiseAllocationMatrix(iris.clusterings)
probabilities

expectedCounts <- expectedPairwiseAllocationMatrix(USArrests.featureAllocations)
expectedCounts

## Don't show: 
rscala::scalaDisconnect(sdols:::s)
## End(Don't show)
## End(No test)




