library(bqtl)


### Name: residuals.bqtl
### Title: Residuals from QTL models
### Aliases: residuals.bqtl
### Keywords: methods

### ** Examples


data(little.ana.bc)

fit.pheno <- bqtl(bc.phenotype~locus(15)+locus(42),little.ana.bc)

summary(residuals(fit.pheno))

plot( fitted( fit.pheno ), residuals( fit.pheno) )

## Don't show: 
rm(little.ana.bc,fit.pheno)
## End(Don't show)




