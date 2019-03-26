library(umx)


### Name: umx_standardize_Simplex
### Title: Standardize a Simplex twin model
### Aliases: umx_standardize_Simplex

### ** Examples

## Not run: 
##D data(iqdat)
##D mzData = subset(iqdat, zygosity == "MZ")
##D dzData = subset(iqdat, zygosity == "DZ")
##D m1  = umxSimplex(selDVs = paste0("IQ_age", 1:4), sep = "_T", 
##D 			dzData = dzData, mzData = mzData, tryHard = "mxTryHard")
##D std = umx_standardize_Simplex(m1)
## End(Not run)




