library(RecordLinkage)


### Name: epiWeights
### Title: Calculate EpiLink weights
### Aliases: epiWeights epiWeights-methods epiWeights,RecLinkData-method
###   epiWeights,RLBigData-method
### Keywords: classif

### ** Examples

# generate record pairs
data(RLdata500)
p=compare.dedup(RLdata500,strcmp=TRUE ,strcmpfun=levenshteinSim,
  identity=identity.RLdata500, blockfld=list("by", "bm", "bd"))

# calculate weights
p=epiWeights(p)

# classify and show results
summary(epiClassify(p,0.6))



