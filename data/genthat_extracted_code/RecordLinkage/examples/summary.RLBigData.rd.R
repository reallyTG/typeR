library(RecordLinkage)


### Name: summary.RLBigData
### Title: summary methods for '"RLBigData"' objects.
### Aliases: summary.RLBigData summary.RLBigDataDedup
###   summary.RLBigDataLinkage print.summaryRLBigDataDedup
###   print.summaryRLBigDataLinkage
### Keywords: methods

### ** Examples

  data(RLdata500)
  rpairs <- RLBigDataDedup(RLdata500, identity = identity.RLdata500,
     blockfld=list(1,3,5:7))
  rpairs <- epiWeights(rpairs)
  summary(rpairs)



