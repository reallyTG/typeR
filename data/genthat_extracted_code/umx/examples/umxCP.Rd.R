library(umx)


### Name: umxCP
### Title: umxCP: Build and run a Common pathway twin model
### Aliases: umxCP

### ** Examples

## Not run: 
##D # ========================================================
##D # = Run a 3-factor Common pathway twin model of 6 traits =
##D # ========================================================
##D require(umx)
##D data(GFF)
##D mzData = subset(GFF, zyg_2grp == "MZ")
##D dzData = subset(GFF, zyg_2grp == "DZ")
##D selDVs = c("gff", "fc", "qol", "hap", "sat", "AD") 
##D m1 = umxCP("new", selDVs = selDVs, sep = "_T", nFac = 3, optimizer = "SLSQP",
##D 		dzData = dzData, mzData = mzData, tryHard = "mxTryHardOrdinal")
##D mold = umxCPold("old", selDVs = selDVs, sep = "_T", nFac = 3, dzData = dzData, mzData = mzData)
##D umxCompare(m1, mold)
##D 
##D # =================================================
##D # = Find and test dropping of shared environment  =
##D # =================================================
##D # Show all labels for C parameters 
##D umxParameters(m1, patt = "^c")
##D # Test dropping the 9 specific and common-factor C paths
##D m2 = umxModify(m1, regex = "(cs_.*$)|(c_cp_)", name = "dropC", comp = TRUE)
##D umxSummaryCP(m2, comparison = m1, file = NA)
##D umxCompare(m1, m2)
##D 
##D # =======================================
##D # = Mixed continuous and binary example =
##D # =======================================
##D data(GFF)
##D # Cut to form umxFactor 20% depressed  DEP
##D cutPoints = quantile(GFF[, "AD_T1"], probs = .2, na.rm = TRUE)
##D ADLevels  = c('normal', 'depressed')
##D GFF$DEP_T1 = cut(GFF$AD_T1, breaks = c(-Inf, cutPoints, Inf), labels = ADLevels) 
##D GFF$DEP_T2 = cut(GFF$AD_T2, breaks = c(-Inf, cutPoints, Inf), labels = ADLevels) 
##D ordDVs = c("DEP_T1", "DEP_T2")
##D GFF[, ordDVs] = umxFactor(GFF[, ordDVs])
##D 
##D selDVs = c("gff","fc","qol","hap","sat","DEP") 
##D mzData = subset(GFF, zyg_2grp == "MZ")
##D dzData = subset(GFF, zyg_2grp == "DZ")
##D allData = rbind(mzData, dzData) 
##D 
##D # umx_set_optimizer("NPSOL")
##D # umx_set_optimization_options("mvnRelEps", .01)
##D m1 = umxCP(selDVs = selDVs, sep = "_T", nFac = 3, dzData = dzData, mzData = mzData)
##D m2 = umxModify(m1, regex = "(cs_r[3-5]|c_cp_r[12])", name = "dropC", comp= TRUE)
##D 
##D # Correlated factors example
##D data(GFF)
##D mzData = subset(GFF, zyg_2grp == "MZ")
##D dzData = subset(GFF, zyg_2grp == "DZ")
##D selDVs = c("gff", "fc", "qol", "hap", "sat", "AD")
##D m1 = umxCP("new", selDVs = selDVs, sep = "_T", dzData = dzData, mzData = mzData, 
##D 	nFac = 3, correlatedA = TRUE, tryHard = "mxTryHard")
## End(Not run)




