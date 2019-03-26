library(snpRF)


### Name: treesize
### Title: Size of trees in an ensemble
### Aliases: treesize
### Keywords: classif

### ** Examples

data(snpRFexample)
eg.rf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
               xchrom.names=xchrom.snps.names,x.covar=covariates, 
               y=phenotype)
hist(treesize(eg.rf))



