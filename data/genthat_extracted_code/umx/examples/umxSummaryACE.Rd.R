library(umx)


### Name: umxSummaryACE
### Title: Shows a compact, publication-style, summary of a umx Cholesky
###   ACE model
### Aliases: umxSummaryACE umxSummary.MxModelACE

### ** Examples

require(umx)
data(twinData)
selDVs = c("bmi1", "bmi2")
mzData <- subset(twinData, zygosity == "MZFF")
dzData <- subset(twinData, zygosity == "DZFF")
m1 = umxACE(selDVs = selDVs, dzData = dzData, mzData = mzData)
umxSummary(m1)
## Not run: 
##D umxSummaryACE(m1, file = NA);
##D umxSummaryACE(m1, file = "name", std = TRUE)
##D stdFit = umxSummaryACE(m1, returnStd = TRUE);
## End(Not run)



