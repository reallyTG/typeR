library(umx)


### Name: umxPlotGxE
### Title: Plot the results of a GxE univariate test for moderation of ACE
###   components.
### Aliases: umxPlotGxE plot.MxModelGxE

### ** Examples

require(umx)
data(twinData) 
twinData$age1 = twinData$age2 = twinData$age
selDVs  = "bmi"
selDefs = "age"
mzData  = subset(twinData, zygosity == "MZFF")
dzData  = subset(twinData, zygosity == "DZFF")
m1 = umxGxE(selDVs = selDVs, selDefs = selDefs, 
 	dzData = dzData, mzData = mzData, sep= "", dropMissing = TRUE)
plot(m1)
umxPlotGxE(x = m1, xlab = "SES", separateGraphs = TRUE, location = "topleft")



