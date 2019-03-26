library(umx)


### Name: umxSummaryGxE
### Title: umxSummaryGxE
### Aliases: umxSummaryGxE umxSummary.MxModelGxE

### ** Examples

# The total sample has been subdivided into a young cohort, 
# aged 18-30 years, and an older cohort aged 31 and above.
# Cohort 1 Zygosity is coded as follows 1 == MZ females 2 == MZ males 
# 3 == DZ females 4 == DZ males 5 == DZ opposite sex pairs
require(umx)
data(twinData) 
twinData$age1 = twinData$age2 = twinData$age
selDVs  = c("bmi1", "bmi2")
selDefs = c("age1", "age2")
selVars = c(selDVs, selDefs)
mzData  = subset(twinData, zygosity == "MZFF", selVars)
dzData  = subset(twinData, zygosity == "DZMM", selVars)
# Exclude cases with missing Def
mzData <- mzData[!is.na(mzData[selDefs[1]]) & !is.na(mzData[selDefs[2]]),]
dzData <- dzData[!is.na(dzData[selDefs[1]]) & !is.na(dzData[selDefs[2]]),]
## Not run: 
##D m1 = umxGxE(selDVs = selDVs, selDefs = selDefs, dzData = dzData, mzData = mzData)
##D # Plot Moderation
##D umxSummaryGxE(m1)
##D umxSummaryGxE(m1, location = "topright")
##D umxSummaryGxE(m1, separateGraphs = FALSE)
## End(Not run)



