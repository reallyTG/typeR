library(snpRF)


### Name: plot.snpRF
### Title: Plot method for snpRF objects
### Aliases: plot.snpRF
### Keywords: classif tree

### ** Examples

data(snpRFexample)
plot(snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
           xchrom.names=xchrom.snps.names,x.covar=covariates,
           y=phenotype,keep.forest=TRUE), log="y")



