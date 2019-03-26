library(missMDA)


### Name: imputeFAMD
### Title: Impute mixed dataset
### Aliases: imputeFAMD
### Keywords: models multivariate

### ** Examples

## Not run: 
##D data(ozone)
##D res.impute <- imputeFAMD(ozone, ncp=3) 
##D ## The output can be used as an input of the FAMD function of the FactoMineR package 
##D ##to perform the FAMD on the incomplete data ozone 
##D require(FactoMineR)
##D res.afdm <- FAMD(ozone,tab.comp=res.impute$tab.disj) 
## End(Not run)



