library(snpRF)


### Name: varUsed
### Title: Variables used in a random forest
### Aliases: varUsed
### Keywords: tree

### ** Examples

data(snpRFexample)
set.seed(17)
varUsed(snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
              xchrom.names=xchrom.snps.names,x.covar=covariates, 
              y=phenotype,ntree=100))



