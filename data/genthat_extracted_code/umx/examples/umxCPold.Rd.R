library(umx)


### Name: umxCPold
### Title: umxCPold: Build and run a Common pathway twin model
### Aliases: umxCPold

### ** Examples

## Not run: 
##D require(umx)
##D data(GFF)
##D mzData <- subset(GFF, zyg_2grp == "MZ")
##D dzData <- subset(GFF, zyg_2grp == "DZ")
##D selDVs = c("gff","fc","qol","hap","sat","AD") # These will be expanded into "gff_T1" "gff_T2" etc.
##D m1 = umxCPold(selDVs = selDVs, sep = "_T", nFac = 3, dzData = dzData, mzData = mzData)
##D umxSummary(m1)
##D umxParameters(m1, patt = "^c")
##D m2 = umxModify(m1, regex = "(cs_.*$)|(c_cp_)", name = "dropC")
##D umxSummaryCP(m2, comparison = m1, file = NA)
##D umxCompare(m1, m2)
## End(Not run)



