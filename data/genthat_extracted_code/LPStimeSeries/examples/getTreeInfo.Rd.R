library(LPStimeSeries)


### Name: getTreeInfo
### Title: Extract a single tree from the ensemble.
### Aliases: getTreeInfo
### Keywords: tree

### ** Examples

data(GunPoint)
set.seed(71)

## Learn patterns on GunPoint training series with 50 trees
ensemble=learnPattern(GunPoint$trainseries,ntree=50)
getTreeInfo(ensemble, 3)



