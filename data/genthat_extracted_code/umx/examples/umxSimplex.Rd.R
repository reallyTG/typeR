library(umx)


### Name: umxSimplex
### Title: Build and run a simplex twin model (not ready for use!)
### Aliases: umxSimplex

### ** Examples

## Not run: 
##D data(iqdat)
##D mzData = subset(iqdat, zygosity == "MZ")
##D dzData = subset(iqdat, zygosity == "DZ")
##D baseVars = c("IQ_age1", "IQ_age2", "IQ_age3", "IQ_age4")
##D m1= umxSimplex(selDVs= baseVars, dzData= dzData, mzData= mzData, sep= "_T", tryHard= "mxTryHard")
##D 
##D umxSummary(m1)
##D parameters(m1, patt = "^s")
##D m2 = umxModify(m1, regex = "as_r1c1", name = "no_as", comp = TRUE)
##D umxCompare(m1, m2)
##D 
##D # =============================
##D # = Test a 3 time-point model =
##D # =============================
##D m1 = umxSimplex(selDVs = paste0("IQ_age", 1:3), 
##D 			dzData = dzData, mzData = mzData, sep = "_T", tryHard = "mxTryHard")
## End(Not run)



