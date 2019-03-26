library(umx)


### Name: xmu_starts
### Title: Helper for boilerplate means and variance start values for twin
###   models
### Aliases: xmu_starts

### ** Examples

data(twinData)
selDVs = c("wt", "ht")
mzData = twinData[twinData$zygosity %in%  "MZFF", ] 
dzData = twinData[twinData$zygosity %in%  "DZFF", ]
round(sqrt(var(dzData[,tvars(selDVs, "")], na.rm=TRUE)/3),3)
tmp = xmu_starts(mzData, dzData, selVars = selDVs, sep= "", 
	equateMeans = TRUE, varForm = "Cholesky")
tmp
round(var(dzData[,tvars(selDVs, "")], na.rm=TRUE)/3,3)
tmp = xmu_starts(mzData, dzData, selVars = selDVs, sep= "", 
	equateMeans = TRUE, varForm = "Cholesky", SD=FALSE)
tmp
# one variable
tmp = xmu_starts(mzData, dzData, selVars = "wt", sep= "", 
	equateMeans = TRUE, varForm = "Cholesky", SD= FALSE)



