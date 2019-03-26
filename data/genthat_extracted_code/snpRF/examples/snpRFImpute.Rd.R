library(snpRF)


### Name: snpRFImpute
### Title: Missing Value Imputations by snpRF
### Aliases: snpRFImpute
### Keywords: classif tree

### ** Examples


data(snpRFexample)
covar.na <- covariates
set.seed(111)
## artificially drop some data values.
for (i in 1:2) covar.na[sample(200, sample(20)), i] <- NA
set.seed(222)
eg.imputed <- snpRFImpute(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
                          x.covar=covar.na, y=phenotype)

set.seed(333)
eg.rf <- snpRF(x.autosome=autosome.snps,x.xchrom=xchrom.snps,
               xchrom.names=xchrom.snps.names,x.covar=eg.imputed, 
               y=phenotype)
print(eg.rf)



