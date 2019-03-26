library(snpRF)


### Name: MDSplot
### Title: Multi-dimensional Scaling Plot of Proximity matrix from snpRF
### Aliases: MDSplot
### Keywords: classif tree

### ** Examples

set.seed(1)
data(snpRFexample)
eg.rf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
               xchrom.names=xchrom.snps.names,x.covar=covariates,
               y=phenotype, proximity=TRUE,keep.forest=FALSE)
MDSplot(eg.rf, phenotype)
## Using different symbols for the classes:
MDSplot(eg.rf, phenotype, palette=rep(1, 2), pch=as.numeric(phenotype))



