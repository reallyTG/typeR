library(RecordLinkage)


### Name: stochastic
### Title: Stochastic record linkage.
### Aliases: fsClassify fsClassify-methods fsClassify,RLBigData-method
###   fsClassify,RecLinkData-method fsWeights fsWeights-methods
###   fsWeights,RLBigData-method fsWeights,RecLinkData-method
### Keywords: classif

### ** Examples

# generate record pairs
data(RLdata500)
rpairs <- compare.dedup(RLdata500, blockfld=list(1,3,5,6,7), identity=identity.RLdata500)

# calculate weights
rpairs <- fsWeights(rpairs)

# classify and show results
summary(fsClassify(rpairs,0))



