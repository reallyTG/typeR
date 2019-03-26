library(umx)


### Name: umxSummaryCP
### Title: Present the results of a Common-pathway twin model in table and
###   graphical form
### Aliases: umxSummaryCP umxSummary.MxModelCP

### ** Examples

## Not run: 
##D require(umx)
##D umx_set_optimizer("SLSQP")
##D data(twinData)
##D twinData$wt1 = twinData$wt1/10
##D twinData$wt2 = twinData$wt2/10
##D selDVs = c("ht", "wt")
##D mzData <- subset(twinData, zygosity == "MZFF")
##D dzData <- subset(twinData, zygosity == "DZFF")
##D umx_set_auto_plot(FALSE) # turn off autoplotting for CRAN
##D m1 = umxCP(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = "", optimizer = "SLSQP")
##D umxSummaryCP(m1, file = NA) # Suppress plot creation with file
##D umxSummary(m1, file = NA)   # Generic summary is the same
##D stdFit = umxSummaryCP(m1, digits = 2, std = TRUE, file = NA, returnStd = TRUE);
##D umxSummary(m1, std = FALSE, showRg = TRUE, file = NA);
##D umxSummary(m1, std = FALSE, file = NA)
##D # =================
##D # = Print example =
##D # =================
##D umxSummary(m1, file = "Figure 3", std = TRUE)
##D # =================
##D # = Confint example =
##D # =================
##D m1 = umxConfint(m1, "smart", run = FALSE);
##D m1 = umxConfint(m1, "smart", run = TRUE);
##D umxSummary(m1, CIs = TRUE, file = NA);
## End(Not run)




