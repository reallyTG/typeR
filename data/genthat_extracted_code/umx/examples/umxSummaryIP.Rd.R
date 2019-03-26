library(umx)


### Name: umxSummaryIP
### Title: Present the results of an independent-pathway twin model in
###   table and graphical form
### Aliases: umxSummaryIP umxSummary.MxModelIP

### ** Examples

require(umx)
data(GFF) # family function and wellbeing data
mzData <- subset(GFF, zyg_2grp == "MZ")
dzData <- subset(GFF, zyg_2grp == "DZ")
selDVs = c("hap", "sat", "AD") # These will be expanded into "hap_T1" "hap_T2" etc.
m1 = umxIP(selDVs = selDVs, sep = "_T", dzData = dzData, mzData = mzData)
umxSummaryIP(m1)
plot(m1)
## Not run: 
##D umxSummaryIP(m1, digits = 2, file = "Figure3", showRg = FALSE, CIs = TRUE);
## End(Not run)



