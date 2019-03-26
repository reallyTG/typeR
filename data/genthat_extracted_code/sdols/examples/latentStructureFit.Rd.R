library(sdols)


### Name: latentStructureFit
### Title: Compute Fit Summaries for a Latent Structure Estimate
### Aliases: latentStructureFit

### ** Examples

## No test: 
probabilities <- expectedPairwiseAllocationMatrix(iris.clusterings)
estimate <- salso(probabilities)
latentStructureFit(estimate, probabilities)

expectedCounts <- expectedPairwiseAllocationMatrix(USArrests.featureAllocations)
estimate <- salso(expectedCounts,"featureAllocation")
latentStructureFit(estimate, expectedCounts)

## Don't show: 
rscala::scalaDisconnect(sdols:::s)
## End(Don't show)
## End(No test)




