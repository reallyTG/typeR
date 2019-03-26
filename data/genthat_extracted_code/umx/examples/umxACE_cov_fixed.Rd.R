library(umx)


### Name: umxACE_cov_fixed
### Title: Run a Cholesky with covariates ("fixed" / definition variables
###   in the means style)
### Aliases: umxACE_cov_fixed

### ** Examples

require(umx)
data(twinData) # ?twinData from Australian twins.
# Pick the variables
selDVs  = "ht"
selCovs = "age"
mzData <- twinData[twinData$zygosity %in% "MZFF", ]
dzData <- twinData[twinData$zygosity %in% "DZFF", ]
m1 = umxACE_cov_fixed(selDVs = selDVs, selCovs = selCovs, sep = "",
	     dzData = dzData, mzData = mzData)
m2 = umxACE(selDVs = selDVs, sep = "", dzData = dzData, mzData = mzData)
# =======================
# = lm-based equivalent =
# =======================
df_res = umx_residualize(ht ~ age, suffixes = c("1", "2"), data = twinData)
mzData <- df_res[df_res$zygosity %in% "MZFF", ]
dzData <- df_res[df_res$zygosity %in% "DZFF", ]
m3 = umxACE("lm_based", selDVs = selDVs, sep = "", dzData = dzData, mzData = mzData)
# ===============================
# = Example with two covariates =
# ===============================
selDVs  = "wt"
selCovs = c("age", "cohort")
twinData$cohort1 = twinData$cohort2 = as.numeric(as.factor(twinData$cohort))
mzData <- twinData[twinData$zygosity %in% "MZFF", ]
dzData <- twinData[twinData$zygosity %in% "DZFF", ]
m1 = umxACE_cov_fixed(selDVs = selDVs, selCovs = selCovs, sep = "",
	     dzData = dzData, mzData = mzData)
m1 = umxACE(selDVs = selDVs, sep = "", dzData = dzData, mzData = mzData)



