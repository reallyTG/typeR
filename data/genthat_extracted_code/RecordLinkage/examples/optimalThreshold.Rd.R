library(RecordLinkage)


### Name: optimalThreshold
### Title: Optimal Threshold for Record Linkage
### Aliases: optimalThreshold optimalThreshold-methods
###   optimalThreshold,RecLinkData-method optimalThreshold,RLBigData-method
### Keywords: classif

### ** Examples

# create record pairs
data(RLdata500)
p=compare.dedup(RLdata500,identity=identity.RLdata500, strcmp=TRUE,
  strcmpfun=levenshteinSim)

# calculate weights
p=epiWeights(p)

# split record pairs in two sets
l=splitData(dataset=p, prop=0.5, keep.mprop=TRUE)

# get threshold from training set
threshold=optimalThreshold(l$train)

# classify remaining data
summary(epiClassify(l$valid,threshold))



