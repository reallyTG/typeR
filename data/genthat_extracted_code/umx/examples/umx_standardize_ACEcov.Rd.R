library(umx)


### Name: umx_standardize_ACEcov
### Title: umx_standardize_ACEcov
### Aliases: umx_standardize_ACEcov

### ** Examples

require(umx)
data(twinData)
twinData$age1 = twinData$age2 = twinData$age
selDVs  = c("bmi")
selCovs = c("ht") # silly example
selVars = umx_paste_names(c(selDVs, selCovs), sep = "", suffixes= 1:2)
mzData = subset(twinData, zyg == 1, selVars)[1:80, ]
dzData = subset(twinData, zyg == 3, selVars)[1:80, ]
m1 = umxACEcov(selDVs = selDVs, selCovs = selCovs, dzData = dzData, mzData = mzData, 
	 sep = "", autoRun = TRUE)
fit = umx_standardize_ACEcov(m1)



