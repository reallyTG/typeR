library(snpRF)


### Name: grow
### Title: Add trees to an ensemble
### Aliases: grow grow.default grow.snpRF
### Keywords: classif

### ** Examples

data(snpRFexample)
eg.rf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
               xchrom.names=xchrom.snps.names,x.covar=covariates, 
               y=phenotype,ntree=50, norm.votes=FALSE)
eg.rf <- grow(eg.rf, 50)
print(eg.rf)



