library(snpRF)


### Name: na.roughfix
### Title: Rough Imputation of Missing Values
### Aliases: na.roughfix na.roughfix.default na.roughfix.data.frame
### Keywords: NA

### ** Examples

data(snpRFexample)
covar.na <- covariates
set.seed(111)
## artificially drop some data values.
for (i in 1:2) covar.na[sample(200, sample(20)), i] <- NA
eg.roughfix <- na.roughfix(covar.na)
eg.narf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
                 xchrom.names=xchrom.snps.names,x.covar=eg.roughfix,
                 y=phenotype)
print(eg.narf)



