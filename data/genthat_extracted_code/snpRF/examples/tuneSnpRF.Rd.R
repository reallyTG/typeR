library(snpRF)


### Name: tuneSnpRF
### Title: Tune snpRF for the optimal mtry parameter
### Aliases: tuneSnpRF
### Keywords: classif tree

### ** Examples

data(snpRFexample)
eg.res <- tuneSnpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
                    xchrom.names=xchrom.snps.names,x.covar=covariates, 
                    y=phenotype, stepFactor=1.5)



