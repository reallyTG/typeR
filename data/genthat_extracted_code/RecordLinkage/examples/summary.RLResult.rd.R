library(RecordLinkage)


### Name: summary.RLResult
### Title: Summary method for '"RLResult"' objects.
### Aliases: summary.RLResult summary,RLResult-method print.summaryRLResult
### Keywords: methods

### ** Examples

  data(RLdata500)
  rpairs <- RLBigDataDedup(RLdata500, blockfld=list(1,3,5:7),
    identity = identity.RLdata500)
  rpairs <- epiWeights(rpairs)
  result <- epiClassify(rpairs, 0.7)
  summary(result)



