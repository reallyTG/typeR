library(umx)


### Name: umxIP
### Title: umxIP: Build and run an Independent pathway twin model
### Aliases: umxIP

### ** Examples

## Not run: 
##D require(umx)
##D data(GFF)
##D mzData <- subset(GFF, zyg_2grp == "MZ")
##D dzData <- subset(GFF, zyg_2grp == "DZ")
##D selDVs = c("gff","fc","qol","hap","sat","AD") # These will be expanded into "gff_T1" "gff_T2" etc.
##D m1 = umxIP(selDVs = selDVs, sep = "_T", dzData = dzData, mzData = mzData)
##D m1 = umxIP(selDVs = selDVs, sep = "_T", dzData = dzData, mzData = mzData, 
##D 	nFac = c(a=3, c = 1, e = 1)
##D )
##D umxSummary(m1)
##D plot(m1)
## End(Not run)



