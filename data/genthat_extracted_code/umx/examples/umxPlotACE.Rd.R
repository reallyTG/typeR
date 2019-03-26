library(umx)


### Name: umxPlotACE
### Title: umxPlotACE
### Aliases: umxPlotACE plot.MxModelACE

### ** Examples

require(umx)
data(twinData)
selDVs = "bmi"
mzData <- subset(twinData, zygosity == "MZFF")
dzData <- subset(twinData, zygosity == "DZFF")
m1 = umxACE(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = "")
plot(m1, std = FALSE) # don't standardize



