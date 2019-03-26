library(umx)


### Name: umxPlotACEv
### Title: Produce a graphical display of an ACE variance-components twin
###   model
### Aliases: umxPlotACEv plot.MxModelACEv

### ** Examples

require(umx)
data(twinData)
selDVs = "bmi"
mzData <- subset(twinData, zygosity == "MZFF")
dzData <- subset(twinData, zygosity == "DZFF")
m1 = umxACEv(selDVs = selDVs, dzData = dzData, mzData = mzData, sep = "")
plot(m1, std = FALSE) # don't standardize



