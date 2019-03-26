library(snpRF)


### Name: margin
### Title: Margins of snpRF Classifier
### Aliases: margin margin.default margin.snpRF plot.margin
### Keywords: classif

### ** Examples

set.seed(1)
data(snpRFexample)
eg.rf<-snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
             xchrom.names=xchrom.snps.names,x.covar=covariates,
             y=phenotype,keep.forest=FALSE)
plot(margin(eg.rf))



