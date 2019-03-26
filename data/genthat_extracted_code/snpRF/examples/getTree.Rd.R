library(snpRF)


### Name: getTree
### Title: Extract a single tree from a forest.
### Aliases: getTree
### Keywords: tree

### ** Examples

data(snpRFexample)
## Look at the third trees in the forest.
getTree(snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
              xchrom.names=xchrom.snps.names,x.covar=covariates,
              y=phenotype,ntree=10), 3, labelVar=TRUE)



