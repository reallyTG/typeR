library(RecordLinkage)


### Name: subset
### Title: Subset operator for record linkage objects
### Aliases: [.RecLinkData [.RecLinkResult [.RLBigData [.RLResult
### Keywords: classif

### ** Examples


## Samples a subset of pairs

data(RLdata500)
rpairs <- compare.dedup(RLdata500, identity = identity.RLdata500,
  blockfld = list(1,3,5,6,7))
nPairs <- nrow(rpairs$pairs)
s <- sample(nPairs, nPairs / 2)
samp <- rpairs[s]



