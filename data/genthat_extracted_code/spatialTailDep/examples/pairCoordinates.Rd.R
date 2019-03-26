library(spatialTailDep)


### Name: pairCoordinates
### Title: Function 'pairCoordinates'
### Aliases: pairCoordinates

### ** Examples

(locations<-cbind(rep(1:2,3),rep(1:3,each=2)))
(pairs <- selectPairIndices(locations, maxDistance = 1.5))
pairCoordinates(locations, pairs)



