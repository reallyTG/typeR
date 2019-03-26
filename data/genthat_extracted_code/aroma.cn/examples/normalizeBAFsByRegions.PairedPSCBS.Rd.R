library(aroma.cn)


### Name: normalizeBAFsByRegions.PairedPSCBS
### Title: Normalizes allele B fractions (BAFs) based on region-based PSCN
###   estimates
### Aliases: normalizeBAFsByRegions.PairedPSCBS
###   PairedPSCBS.normalizeBAFsByRegions
###   normalizeBAFsByRegions,PairedPSCBS-method
### Keywords: internal methods

### ** Examples

library("aroma.cn")

if (Sys.getenv("_R_CHECK_FULL_") != "" && require("PSCBS")) {

# Load example ASCN data
data <- PSCBS::exampleData("paired.chr01")
R.oo::attachLocally(data)

# AD HOC: Robustification
CT[CT < 0] <- 0
CT[CT > 30] <- 30

# PSCBS segmentation
fit <- segmentByPairedPSCBS(CT, betaT=betaT, betaN=betaN, x=x, verbose=-10)

# Normalize
fitN <- normalizeBAFsByRegions(fit, verbose=-10)

devSet("tracks")
subplots(10, ncol=2, byrow=FALSE)
par(mar=c(1,3.5,1,0.5)+1)
plot(fit, subplots=TRUE)
plot(fitN, subplots=TRUE)


devSet("C1C2")
Clim <- c(0,4)
subplots(4, ncol=2, byrow=TRUE)
par(mar=c(1,3.5,1,0.5)+1)
plotC1C2(fit, Clim=Clim)
linesC1C2(fit)
title(main="(C1,C2)")

plotC1C2(fitN, Clim=Clim)
linesC1C2(fitN)
title(main="(C1,C2) - adjusted")

plotC1C2(fit, col="gray", Clim=Clim)
linesC1C2(fit, col="gray")
pointsC1C2(fitN)
linesC1C2(fitN)
title(main="(C1,C2) - both")

} # if (require("PSCBS"))



