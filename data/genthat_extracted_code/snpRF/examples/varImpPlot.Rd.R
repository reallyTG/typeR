library(snpRF)


### Name: varImpPlot
### Title: Variable Importance Plot
### Aliases: varImpPlot
### Keywords: classif tree

### ** Examples

set.seed(4543)
data(snpRFexample)
eg.rf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
               xchrom.names=xchrom.snps.names,x.covar=covariates, 
               y=phenotype,keep.forest=FALSE, importance=TRUE)
varImpPlot(eg.rf)



