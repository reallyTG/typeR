library(featurefinder)


### Name: generateResidualCutoffCode
### Title: generateResidualCutoffCode
### Aliases: generateResidualCutoffCode
### Keywords: saveTree

### ** Examples


require(featurefinder)
data(examples)
generateResidualCutoffCode(data=dat0,"treesAll.txt",treesAll,mainfaclevels, runname,
  treeGenerationMinBucket=treeGenerationMinBucket,
  treeSummaryMinBucket=treeSummaryMinBucket,
  treeSummaryResidualThreshold=treeSummaryResidualThreshold,
  treeSummaryResidualMagnitudeThreshold=treeSummaryResidualMagnitudeThreshold,
  doAllFactors=doAllFactors,
  maxFactorLevels=maxFactorLevels)



