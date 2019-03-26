library(umx)


### Name: umxReduceACE
### Title: Reduce an ACE model.
### Aliases: umxReduceACE

### ** Examples

data(twinData)
mzData <- subset(twinData, zygosity == "MZFF")
dzData <- subset(twinData, zygosity == "DZFF")
m1 = umxACE(selDVs = "bmi", dzData = dzData, mzData = mzData, sep = "")
m2 = umxReduce(m1)
umxSummary(m2)
m1 = umxACE(selDVs = "bmi", dzData = dzData, mzData = mzData, sep = "", dzCr = .25)
m2 = umxReduce(m1)



