library(umx)


### Name: umx_standardize_ACEv
### Title: Standardize an ACE variance components model (ACEv)
### Aliases: umx_standardize_ACEv

### ** Examples

require(umx)
data(twinData)
selDVs = c("bmi")
mzData <- twinData[twinData$zygosity %in% "MZFF",][1:80,] # 80 pairs for speed
dzData <- twinData[twinData$zygosity %in% "DZFF",][1:80,]
m1  = umxACEv(selDVs = selDVs, sep="", dzData = dzData, mzData = mzData)
std = umx_standardize(m1)



