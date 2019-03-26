library(umx)


### Name: umxACEv
### Title: Build and run 2-group uni- or multi-variate ACE models based on
###   VARIANCE (not paths).
### Aliases: umxACEv

### ** Examples


# ==============================
# = Univariate model of weight =
# ==============================
require(umx)
data(twinData) # ?twinData from Australian twins.

# Things to note: ACE model of weight will return a NEGATIVE variance in C.
#  This is exactly why we have ACEv! It suggests we need a different model
#  In this case: ADE.
# Other things to note:
# 1. umxACEv can figure out variable names: provide "sep", and selVars. 
#    Function generates: "wt" -> "wt1" "wt2"
# 2. umxACEv picks the variables it needs from the data.

selDVs = "wt"
mzData <- twinData[twinData$zygosity %in% "MZFF", ]
dzData <- twinData[twinData$zygosity %in% "DZFF", ]
m1 = umxACEv(selDVs = selDVs, sep = "", dzData = dzData, mzData = mzData)

# ========================================================
# = Evidence for dominance ? (DZ correlation set to .25) =
# ========================================================
m2 = umxACEv("ADE", selDVs = selDVs, sep = "", dzData = dzData, mzData = mzData, dzCr = .25)
# note: the underlying matrices are still called A, C, and E.
# I catch this in the summary table, so columns are labeled A, D, and E.
# However, currently, the plot will say A, C, E.

# We can modify this model, dropping dominance component (still called C), 
# and see a comparison:
m3 = umxModify(m2, update = "C_r1c1", comparison = TRUE, name="AE")
# =========================================================
# = Well done! Now you can make modify twin models in umx =
# =========================================================

# ============================
# = How heritable is height? =
# ============================
# 
# Note: Height has a small variance. umx can typically picks good starts,
#    but scaling is advisable.
# 
require(umx)
data(twinData) # ?twinData from Australian twins.
# Pick the variables
selDVs = "ht"
twinData$ht1 = twinData$ht1*10
twinData$ht2 = twinData$ht2*10
mzData <- twinData[twinData$zygosity %in% "MZFF", ]
dzData <- twinData[twinData$zygosity %in% "DZFF", ]
m1 = umxACEv(selDVs = selDVs, sep = "", dzData = dzData, mzData = mzData)
umxSummary(m1, std = FALSE) # unstandardized
# tip: with report = "html", umxSummary can print the table to your browser!
plot(m1)

# ========================================================
# = Evidence for dominance ? (DZ correlation set to .25) =
# ========================================================
m2 = umxACEv("ADE", selDVs = selDVs, sep="", dzData = dzData, mzData = mzData, dzCr = .25)
umxCompare(m2, m1) # Is ADE better?
umxSummary(m2, comparison = m1) # nb: though this is ADE, matrices are still called A,C,E

# We can modify this model, dropping shared environment, and see a comparison:
m3 = umxModify(m2, update = "C_r1c1", comparison = TRUE, name = "AE")

# =====================================
# = Bivariate height and weight model =
# =====================================

data(twinData)
twinData$ht1 = twinData$ht1 * 1000 # Convert m to mm
twinData$ht2 = twinData$ht2 * 1000
mzData = twinData[twinData$zygosity %in% c("MZFF", "MZMM"), ]
dzData = twinData[twinData$zygosity %in% c("DZFF", "DZMM", "DZOS"), ]
mzData = mzData[1:80, ] # Quicker run to keep CRAN happy
dzData = dzData[1:80, ]
m1 = umxACEv(selDVs = c("ht", "wt"), sep = '', dzData = dzData, mzData = mzData)

# ===================
# = Ordinal example =
# ===================
require(umx)
data(twinData)
# Cut bmi column to form ordinal obesity variables
ordDVs = c("obese1", "obese2")
selDVs = c("obese")
obesityLevels = c('normal', 'overweight', 'obese')
cutPoints = quantile(twinData[, "bmi1"], probs = c(.5, .2), na.rm = TRUE)
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
# Make the ordinal variables into mxFactors (ensure ordered is TRUE, and require levels)
twinData[, ordDVs] = mxFactor(twinData[, ordDVs], levels = obesityLevels)
mzData = twinData[twinData$zygosity %in% "MZFF", ][1:80,] # 80 pairs for speed
dzData = twinData[twinData$zygosity %in% "DZFF", ][1:80,]
str(mzData) # make sure mz, dz, and t1 and t2 have the same levels!
m1 = umxACEv(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = '')
umxSummary(m1)

# ============================================
# = Bivariate continuous and ordinal example =
# ============================================
data(twinData)
selDVs = c("wt", "obese")
# Cut bmi column to form ordinal obesity variables
ordDVs = c("obese1", "obese2")
obesityLevels = c('normal', 'overweight', 'obese')
cutPoints = quantile(twinData[, "bmi1"], probs = c(.5, .2), na.rm = TRUE)
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 

# Make the ordinal variables into mxFactors (ensure ordered is TRUE, and require levels)
twinData[, ordDVs] = mxFactor(twinData[, ordDVs], levels = obesityLevels)

# umxACEv can trim out unused variables on its own
mzData = twinData[twinData$zygosity %in% "MZFF", ]
dzData = twinData[twinData$zygosity %in% "DZFF", ]
m1 = umxACEv(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = '')
plot(m1)

# =======================================
# = Mixed continuous and binary example =
# =======================================
require(umx)
data(twinData)
# Cut to form category of 20% obese subjects
# and make into mxFactors (ensure ordered is TRUE, and require levels)
cutPoints = quantile(twinData[, "bmi1"], probs = .2, na.rm = TRUE)
obesityLevels = c('normal', 'obese')
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
ordDVs = c("obese1", "obese2")
twinData[, ordDVs] = mxFactor(twinData[, ordDVs], levels = obesityLevels)

selDVs = c("wt", "obese")
mzData = twinData[twinData$zygosity %in% "MZFF", ]
dzData = twinData[twinData$zygosity %in% "DZFF", ]
## Not run: 
##D m1 = umxACEv(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = '')
##D umxSummary(m1)
## End(Not run)

# ===================================
# Example with covariance data only =
# ===================================

require(umx)
data(twinData)
selDVs = c("wt")
mz = cov(twinData[twinData$zygosity %in% "MZFF", tvars(selDVs, "")], use = "complete")
dz = cov(twinData[twinData$zygosity %in% "DZFF", tvars(selDVs, "")], use = "complete")
m1 = umxACEv(selDVs = selDVs, sep= "", dzData = dz, mzData= mz, numObsDZ= 569, numObsMZ= 351)
umxSummary(m1, std = FALSE)




