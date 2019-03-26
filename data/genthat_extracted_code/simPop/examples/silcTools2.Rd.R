library(simPop)


### Name: silcTools2
### Title: Utility functions for EU-SILC data
### Aliases: silcTools2 mergeSILC checkCol chooseSILCvars modifySILC
###   loadSILC mergeSILC checkCol chooseSILCvars modifySILC

### ** Examples

## Not run: 
##D x <- loadSILC("new_workfile.RData")
##D filed <- "zielvar_d_eurostat2013.sav"
##D filer <- "zielvar_r_eurostat2013.sav"
##D filep <- "zielvar_p_eurostat2013.sav"
##D fileh <- "zielvar_h_eurostat2013.sav"
##D suf4 <- loadSILC(filed = filed,
##D                  filer = filer,
##D                  filep = filep,
##D                  fileh = fileh)
## End(Not run)
## Not run: 
##D filed <- "zielvar_d_eurostat2013.sav"
##D filer <- "zielvar_r_eurostat2013.sav"
##D filep <- "zielvar_p_eurostat2013.sav"
##D fileh <- "zielvar_h_eurostat2013.sav"
##D suf4 <- loadSILC(filed = filed,
##D                  filer = filer,
##D                  filep = filep,
##D                  fileh = fileh)
##D suf <- mergeSILC(d = suf4[["d"]],
##D                  r = suf4[["r"]],
##D                  h = suf4[["h"]],
##D                  p = suf4[["p"]])
## End(Not run)
data(eusilc13puf)
## instead of scientific-use file or
## original data we took the 2006 synthetic data
data(eusilcS)
## check which columns of y are in x
checkCol(eusilc13puf, eusilcS)
## Not run: 
##D ## on original silc data to extract needed variables for SGA project on SILC
##D x <- loadSILC("new_workfile.RData")
##D chooseSILCvars(x)
## End(Not run)
## Not run: 
##D ## wrapper to prepare SILC data
##D ## on original silc data
##D x <- loadSILC("new_workfile.RData")
##D x <- chooseSILCvars(x)
##D modifySILC(x)
## End(Not run)



