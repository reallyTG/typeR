library(sdols)


### Name: salso
### Title: Perform Sequentially-Allocated Latent Structure Optimization
### Aliases: salso

### ** Examples

## No test: 

probabilities <- expectedPairwiseAllocationMatrix(iris.clusterings)
salso(probabilities)

expectedCounts <- expectedPairwiseAllocationMatrix(USArrests.featureAllocations)
salso(expectedCounts,"featureAllocation")

## Don't show: 
rscala::scalaDisconnect(sdols:::s)
## End(Don't show)
## End(No test)




