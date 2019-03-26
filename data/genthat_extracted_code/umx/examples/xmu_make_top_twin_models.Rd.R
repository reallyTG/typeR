library(umx)


### Name: xmu_make_top_twin_models
### Title: Helper to make a basic top, MZ, and DZ model.
### Aliases: xmu_make_top_twin_models

### ** Examples

# ==============
# = Continuous =
# ==============
library(umx)
data(twinData)
selDVs = c("wt", "ht")
mzData = twinData[twinData$zygosity %in%  "MZFF",] 
dzData = twinData[twinData$zygosity %in%  "DZFF",]
bits = xmu_make_top_twin_models(mzData= mzData, dzData= dzData, selDVs= selDVs, sep= "", nSib= 2)
names(bits) # "top" "MZ"  "DZ" 

# ============================================
# = Bivariate continuous and ordinal example =
# ============================================
data(twinData)
selDVs = c("wt", "obese")
# Cut BMI column to form ordinal obesity variables
ordDVs          = c("obese1", "obese2")
obesityLevels   = c('normal', 'overweight', 'obese')
cutPoints       = quantile(twinData[, "bmi1"], probs = c(.5, .2), na.rm = TRUE)
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
# Make the ordinal variables into mxFactors (ensure ordered is TRUE, and require levels)
twinData[, ordDVs] = umxFactor(twinData[, ordDVs])
mzData = twinData[twinData$zygosity %in%  "MZFF",] 
dzData = twinData[twinData$zygosity %in%  "DZFF",]
bits = xmu_make_top_twin_models(mzData= mzData, dzData= dzData, selDVs= selDVs, sep="", nSib= 2)
names(bits) # "top" "MZ"  "DZ" 

# ==============
# = One binary =
# ==============
data(twinData)
cutPoints       = quantile(twinData[, "bmi1"], probs = .2, na.rm = TRUE)
obesityLevels   = c('normal', 'obese')
twinData$obese1 = cut(twinData$bmi1, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
twinData$obese2 = cut(twinData$bmi2, breaks = c(-Inf, cutPoints, Inf), labels = obesityLevels) 
ordDVs = c("obese1", "obese2")
twinData[, ordDVs] = umxFactor(twinData[, ordDVs])
selDVs = c("wt", "obese")
mzData = twinData[twinData$zygosity %in% "MZFF",]
dzData = twinData[twinData$zygosity %in% "DZFF",]
bits = xmu_make_top_twin_models(mzData= mzData, dzData= dzData, selDVs= selDVs, sep= "", nSib= 2)

# ============
# = Cov data =
# ============
data(twinData)
selDVs = c("wt")
mz = cov(twinData[twinData$zygosity %in%  "MZFF", tvars(selDVs, sep="")], use = "complete")
dz = cov(twinData[twinData$zygosity %in%  "DZFF", tvars(selDVs, sep="")], use = "complete")
bits = xmu_make_top_twin_models(mzData= mzData, dzData= dzData, selDVs= selDVs, sep= "", nSib= 2)



