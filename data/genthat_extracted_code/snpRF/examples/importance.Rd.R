library(snpRF)


### Name: importance
### Title: Extract variable importance measure
### Aliases: importance importance.default importance.snpRF
### Keywords: classif tree

### ** Examples

set.seed(4543)
data(snpRFexample)

eg.rf<-snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
             xchrom.names=xchrom.snps.names,x.covar=covariates, 
             y=phenotype,keep.forest=FALSE,importance=TRUE)

importance(eg.rf)
importance(eg.rf, type=1)



