library(RMark)


### Name: export.chdata
### Title: Export capture-history data to MARK .inp format
### Aliases: export.chdata
### Keywords: utility

### ** Examples


data(dipper)
dipper$numeric.sex=as.numeric(dipper$sex)-1
dipper.processed=process.data(dipper,group="sex")
export.chdata(dipper.processed, filename="dipper", 
         covariates="numeric.sex",replace=TRUE)
#
# Had sex been used in place of numeric.sex in the above command, 
# MARK would have been unable to use it as a covariate
# because it is not a numeric field




