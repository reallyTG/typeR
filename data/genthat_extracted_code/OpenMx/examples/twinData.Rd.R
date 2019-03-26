library(OpenMx)


### Name: twinData
### Title: Australian twin sample biometric data.
### Aliases: twinData
### Keywords: datasets

### ** Examples

data(twinData)
str(twinData)
plot(wt1 ~ wt2, data = twinData)
selVars = c("bmi1", "bmi2")
mzData <- subset(twinData, zyg == 1, selVars)
dzData <- subset(twinData, zyg == 3, selVars)

# equivalently
mzData <- subset(twinData, zygosity == "MZFF", selVars)

# Disregard sex, pick older cohort
mz <- subset(twinData, zygosity %in% c("MZFF","MZMM") & cohort == "older", selVars)




