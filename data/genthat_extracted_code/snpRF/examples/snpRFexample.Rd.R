library(snpRF)


### Name: snpRFexample
### Title: Simulated genetic data
### Aliases: snpRFexample autosome.snps xchrom.snps xchrom.snps.names
###   covariates phenotype gender
### Keywords: datasets

### ** Examples

data(snpRFexample)

stopifnot(require(snpRF))
eg.rf<-snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
             xchrom.names=xchrom.snps.names,x.covar=covariates, 
             y=phenotype)
print(eg.rf)



