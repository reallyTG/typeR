library(umx)


### Name: umxACEcov
### Title: Run a Cholesky with covariates, either fixed (def var in the
###   means) or random (in the expected covariance matrix)
### Aliases: umxACEcov

### ** Examples

# ============================================
# = BMI, can't use Age as a random covariate =
# ============================================
require(umx)
data(twinData)
# Replicate age to age1 & age2
twinData$age1 = twinData$age2 = twinData$age
# 80 rows so example runs fast for CRAN
mzData = subset(twinData, zygosity == "MZFF")[1:80, ]
dzData = subset(twinData, zygosity == "DZFF")[1:80, ]
## Not run: 
##D mzData = subset(twinData, zygosity == "MZFF")
##D dzData = subset(twinData, zygosity == "DZFF")
## End(Not run)

# =====================================================================
# = Trying to use identical var (like age) as a random cov is ILLEGAL =
# =====================================================================
## Not run: 
##D m1 = umxACEcov(selDVs = "bmi", selCovs = "age", dzData = dzData, mzData = mzData, sep = "")
## End(Not run)

# ========================================================
# = Use an lm-based age-residualisation approach instead =
# ========================================================

resid_data = umx_residualize("bmi", "age", suffixes = 1:2, twinData)
mzData = subset(resid_data, zygosity == "MZFF")
dzData = subset(resid_data, zygosity == "DZFF")
m2     = umxACE("resid", selDVs = "bmi", dzData = dzData, mzData = mzData, sep = "")

# Univariate BMI without covariate of age for comparison
mzData = subset(twinData, zygosity == "MZFF")
dzData = subset(twinData, zygosity == "DZFF")
m3 = umxACE("raw_bmi", selDVs = "bmi", dzData = dzData, mzData = mzData, sep = "")

## Not run: 
##D # ===========================================================================
##D # = A bivariate example (need a dataset with a VIABLE COVARIATE to do this) =
##D # ===========================================================================
##D selDVs  = c("ht", "wt") # Set the DV
##D selCovs = c("income") # Set the COV
##D selVars = umx_paste_names(selDVs, covNames = selCovs, sep = "", sep = 1:2)
##D # 80 rows so example runs fast on CRAN
##D mzData = subset(twinData, zygosity == "MZFF", selVars)[1:80, ]
##D dzData = subset(twinData, zygosity == "DZFF", selVars)[1:80, ]
##D m1 = umxACEcov(selDVs = selDVs, selCovs = selCovs,
##D    dzData = dzData, mzData = mzData, sep = "", autoRun = TRUE
##D )
## End(Not run)



