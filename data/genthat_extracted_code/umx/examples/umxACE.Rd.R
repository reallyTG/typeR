library(umx)


### Name: umxACE
### Title: Build and run a 2-group Cholesky twin model (uni-variate or
###   multi-variate)
### Aliases: umxACE

### ** Examples


# ============================
# = How heritable is height? =
# ============================
require(umx)
data(twinData) # ?twinData from Australian twins.
# Pick the variables
selDVs = c("ht")
mzData <- twinData[twinData$zygosity %in% "MZFF", ]
dzData <- twinData[twinData$zygosity %in% "DZFF", ]
m1 = umxACE(selDVs = selDVs, sep = "", dzData = dzData, mzData = mzData) # -2ll= 9659, a1 = .92
umxSummary(m1, std = FALSE) # unstandardized
# tip: with report = "html", umxSummary can print the table to your browser!
plot(m1)

# ========================================================
# = Evidence for dominance ? (DZ correlation set to .25) =
# ========================================================
m2 = umxACE("ADE", selDVs = selDVs, sep = "", dzData = dzData, mzData = mzData, dzCr = .25)
umxCompare(m2, m1) # ADE is better
umxSummary(m2, comparison = m1) 
# nb: Although summary is smart enough to print d, the underlying 
#     matrices are still called a, c & e.

# ==============================
# = Univariate model of weight =
# ==============================

# Things to note:

# 1. This variable has a large variance, but umx picks good starts.

# 2. umxACE can figure out variable names: provide sep= "_T" and selVar = "wt" -> "wt_T1" "wt_T2"

# 3. umxACE picks the variables it needs from the data.
# 4. note: the default boundDiag = 0 lower-bounds a, c, and e at 0 (prevents mirror-solutions).
        # can remove this by setting boundDiag = NULL
m1 = umxACE(selDVs = "wt", dzData = dzData, mzData = mzData, sep = "", boundDiag = NULL)

# MODEL MODIFICATION
# We can modify this model, say testing shared environment, and see a comparison:

m2 = umxModify(m1, update = "c_r1c1", name = "no_C", comparison = TRUE)
# nb: You can see names of free parameters with parameters(m1)

# =====================================
# = Bivariate height and weight model =
# =====================================
data(twinData)
mzData = twinData[twinData$zygosity %in% c("MZFF", "MZMM"),]
dzData = twinData[twinData$zygosity %in% c("DZFF", "DZMM", "DZOS"), ]
mzData = mzData[1:80,] # quicker run to keep CRAN happy
dzData = dzData[1:80,]
selDVs = c("ht", "wt") # umx will add sep (in this case "") + "1" or '2'
m1 = umxACE(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = '')
# umxSummary(m1)

# =========================================================
# = Well done! Now you can make modify twin models in umx =
# =========================================================


# ===================
# = Ordinal example =
# ===================
require(umx)
data(twinData)
# Cut BMI column to form ordinal obesity variables
obesityLevels = c('normal', 'overweight', 'obese')
cutPoints = quantile(twinData[, "bmi1"], probs = c(.5, .2), na.rm = TRUE)
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
# Make the ordinal variables into umxFactors (ensure ordered is TRUE, and require levels)
ordDVs = c("obese1", "obese2")
twinData[, ordDVs] = mxFactor(twinData[, ordDVs], levels = obesityLevels)
mzData = twinData[twinData$zygosity %in% "MZFF", ]
dzData = twinData[twinData$zygosity %in% "DZFF", ]
mzData = mzData[1:80, ] # Just top 80 pairs to run fast
dzData = dzData[1:80, ]
str(mzData) # make sure mz, dz, and t1 and t2 have the same levels!

# Data-prep done - here's where the model starts:
selDVs = c("obese")
m1 = umxACE(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = '')
# umxSummary(m1)

# ============================================
# = Bivariate continuous and ordinal example =
# ============================================
data(twinData)
# Cut BMI column to form ordinal obesity variables
obesityLevels   = c('normal', 'overweight', 'obese')
cutPoints       = quantile(twinData[, "bmi1"], probs = c(.5, .2), na.rm = TRUE)
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
# Make the ordinal variables into mxFactors (ensure ordered is TRUE, and require levels)
ordDVs = c("obese1", "obese2")
twinData[, ordDVs] = umxFactor(twinData[, ordDVs])
mzData = twinData[twinData$zygosity %in%  "MZFF",] 
dzData = twinData[twinData$zygosity %in%  "DZFF",]
mzData <- mzData[1:80,] # just top 80 so example runs in a couple of secs
dzData <- dzData[1:80,]
m1 = umxACE(selDVs = c("wt", "obese"), dzData = dzData, mzData = mzData, sep = '')

# =======================================
# = Mixed continuous and binary example =
# =======================================
require(umx)
data(twinData)
# Cut to form category of 20% obese subjects
# and make into mxFactors (ensure ordered is TRUE, and require levels)
obesityLevels   = c('normal', 'obese')
cutPoints       = quantile(twinData[, "bmi1"], probs = .2, na.rm = TRUE)
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
ordDVs = c("obese1", "obese2")
twinData[, ordDVs] = umxFactor(twinData[, ordDVs])

selDVs = c("wt", "obese")
mzData = twinData[twinData$zygosity %in% "MZFF",]
dzData = twinData[twinData$zygosity %in% "DZFF",]
## Not run: 
##D m1 = umxACE(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = '')
##D # umxSummary(m1)
## End(Not run)

# ===================================
# Example with covariance data only =
# ===================================

require(umx)
data(twinData)
selDVs = c("wt1", "wt2")
mz = cov(twinData[twinData$zygosity %in%  "MZFF", selDVs], use = "complete")
dz = cov(twinData[twinData$zygosity %in%  "DZFF", selDVs], use = "complete")
m1 = umxACE(selDVs = selDVs, dzData = dz, mzData = mz, numObsDZ=569, numObsMZ=351)
umxSummary(m1)
plot(m1)



