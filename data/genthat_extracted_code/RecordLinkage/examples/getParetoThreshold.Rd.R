library(RecordLinkage)


### Name: getParetoThreshold
### Title: Estimate Threshold from Pareto Distribution
### Aliases: getParetoThreshold getParetoThreshold-methods
###   getParetoThreshold,RecLinkData-method
###   getParetoThreshold,RLBigData-method
### Keywords: models classif

### ** Examples

  data(RLdata500)
  rpairs=compare.dedup(RLdata500, identity=identity.RLdata500, strcmp=TRUE,
    blockfld=list(1,3,5:7))
  rpairs=epiWeights(rpairs)
  # leave out argument interval to choose from plot
  ## Not run: threshold=getParetoThreshold(rpairs,interval=c(0.68, 0.79))
  ## Not run: summary(epiClassify(rpairs,threshold))



