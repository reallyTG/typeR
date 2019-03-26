library(umx)


### Name: umxSummaryACEv
### Title: Shows a compact, publication-style, summary of a variance-based
###   Cholesky ACE model.
### Aliases: umxSummaryACEv umxSummary.MxModelACEv

### ** Examples

require(umx)
data(twinData)
mzData <- subset(twinData, zygosity == "MZFF")
dzData <- subset(twinData, zygosity == "DZFF")
m1 = umxACEv(selDVs = "bmi", sep = "", dzData = dzData, mzData = mzData)
umxSummary(m1, std = FALSE)
## Not run: 
##D umxSummary(m1, file = NA);
##D umxSummary(m1, file = "name", std = TRUE)
##D stdFit = umxSummary(m1, returnStd = TRUE)
## End(Not run)



