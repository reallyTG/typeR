library(miceadds)


### Name: write.datlist
### Title: Write a List of Multiply Imputed Datasets
### Aliases: write.datlist

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Write data list imputed in mice
##D #############################################################################
##D 
##D data(data.ma01)
##D dat <- as.matrix(data.ma01)
##D 
##D # start with empty imputation
##D imp0 <- mice::mice( dat, maxit=0)
##D 
##D # modify predictor matrix
##D predM <- imp0$predictorMatrix
##D predM[, c("idschool", "idstud" ) ] <- 0
##D # modify imputation method
##D impMeth <- imp0$method
##D impMeth[ impMeth=="pmm" ] <- "norm"
##D 
##D # do imputations in mice
##D imp <- mice::mice( dat, predictorMatrix=predM, method=impMeth, m=3, maxit=4 )
##D 
##D # write imputed data in format "csv2" and round after 4 digits
##D write.datlist( datlist=imp, name="mice_imp_csv2", round=4 )
##D # write imputed data in R binary format
##D write.datlist( datlist=imp, name="mice_imp_Rdata", type="Rdata")
##D # write data for Mplus usage
##D write.datlist( datlist=imp, name="mice_imp_Mplus", Mplus=TRUE, round=5)
## End(Not run)



