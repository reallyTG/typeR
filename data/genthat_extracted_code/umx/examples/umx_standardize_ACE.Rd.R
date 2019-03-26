library(umx)


### Name: umx_standardize_ACE
### Title: umx_standardize_ACE
### Aliases: umx_standardize_ACE

### ** Examples

require(umx)
data(twinData)
selDVs = c("bmi1", "bmi2")
mzData <- twinData[twinData$zygosity %in% "MZFF", selDVs][1:80,] # 80 pairs for speed
dzData <- twinData[twinData$zygosity %in% "DZFF", selDVs][1:80,]
m1  = umxACE(selDVs = selDVs, dzData = dzData, mzData = mzData)
std = umx_standardize_ACE(m1)



