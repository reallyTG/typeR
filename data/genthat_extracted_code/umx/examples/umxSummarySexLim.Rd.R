library(umx)


### Name: umxSummarySexLim
### Title: Shows a compact, publication-style, summary of a umx Sex
###   Limitation model
### Aliases: umxSummarySexLim umxSummary.MxModelSexLim

### ** Examples

# =========================
# = Load and Process Data =
# =========================
require(umx)
data("us_skinfold_data")
# rescale vars
us_skinfold_data[, c('bic_T1', 'bic_T2')] <- us_skinfold_data[, c('bic_T1', 'bic_T2')]/3.4
us_skinfold_data[, c('tri_T1', 'tri_T2')] <- us_skinfold_data[, c('tri_T1', 'tri_T2')]/3
us_skinfold_data[, c('caf_T1', 'caf_T2')] <- us_skinfold_data[, c('caf_T1', 'caf_T2')]/3
us_skinfold_data[, c('ssc_T1', 'ssc_T2')] <- us_skinfold_data[, c('ssc_T1', 'ssc_T2')]/5
us_skinfold_data[, c('sil_T1', 'sil_T2')] <- us_skinfold_data[, c('sil_T1', 'sil_T2')]/5

# Variables for Analysis
selDVs = c('ssc','sil','caf','tri','bic') # (was Vars)
# Data objects for Multiple Groups
mzmData = subset(us_skinfold_data, zyg == 1)
mzfData = subset(us_skinfold_data, zyg == 2)
dzmData = subset(us_skinfold_data, zyg == 3)
dzfData = subset(us_skinfold_data, zyg == 4)
dzoData = subset(us_skinfold_data, zyg == 5)

# ============================================================
# = NOT WORKING YET! Should be good to use for Boulder/March =
# ============================================================
m1 = umxSexLim(selDVs = selDVs, sep = "_T", A_or_C = "A", autoRun=FALSE,
	  mzmData = mzmData, dzmData = dzmData, 
       mzfData = mzfData, dzfData = dzfData, 
       dzoData = dzoData)
## Not run: 
##D umxSummary(m1, file = NA);
##D umxSummarySexLim(m1, file = "name", std = TRUE)
##D stdFit = umxSummarySexLim(m1, returnStd = TRUE);
## End(Not run)



