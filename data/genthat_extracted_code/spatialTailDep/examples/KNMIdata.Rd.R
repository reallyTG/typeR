library(spatialTailDep)


### Name: KNMIdata
### Title: Wind speeds in the Netherlands.
### Aliases: KNMIdata

### ** Examples

data(KNMIdata)
locations <- KNMIdata$loc
pairIndices <- selectPairIndices(locations, maxDistance = 0.5)
Mestimator(KNMIdata$data, locations, pairIndices, k = 60, model="BR",
iterate=FALSE, covMat = FALSE)$theta



