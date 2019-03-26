library(snpRF)


### Name: outlier
### Title: Compute outlying measures
### Aliases: outlier outlier.snpRF outlier.default
### Keywords: classif

### ** Examples

set.seed(1)
data(snpRFexample)
eg.rf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
               xchrom.names=xchrom.snps.names,x.covar=covariates, 
               y=phenotype, proximity=TRUE)
plot(outlier(eg.rf), type="h",
     col=c("red", "green", "blue")[as.numeric(phenotype)])



