library(umx)


### Name: umxSummaryACEcov
### Title: Present results of a twin ACE-model with covariates in table and
###   graphical forms.
### Aliases: umxSummaryACEcov umxSummary.MxModelACEcov

### ** Examples

require(umx)
data(twinData)
selDVs = c("bmi1", "bmi2")
mzData <- subset(twinData, zygosity == "MZFF")
dzData <- subset(twinData, zygosity == "DZFF")
m1 = umxACE(selDVs = selDVs, dzData = dzData, mzData = mzData)
m1 = umxRun(m1)
umxSummaryACE(m1)
## Not run: 
##D umxSummaryACE(m1, file = NA);
##D umxSummaryACE(m1, file = "name", std = TRUE)
##D stdFit = umxSummaryACE(m1, returnStd = TRUE);
## End(Not run)



