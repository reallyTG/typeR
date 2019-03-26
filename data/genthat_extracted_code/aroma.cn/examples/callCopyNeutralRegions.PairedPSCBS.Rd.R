library(aroma.cn)


### Name: callCopyNeutralRegions.PairedPSCBS
### Title: Calls regions that are copy neutral
### Aliases: callCopyNeutralRegions.PairedPSCBS
###   PairedPSCBS.callCopyNeutralRegions
###   callCopyNeutralRegions,PairedPSCBS-method
### Keywords: internal methods

### ** Examples


if (Sys.getenv("_R_CHECK_FULL_") != "" && require("PSCBS")) {

# Load example ASCN data
data <- PSCBS::exampleData("paired.chr01");

# PSCBS segmentation
fit <- segmentByPairedPSCBS(data, verbose=-10);

fit <- bootstrapTCNandDHByRegion(fit, verbose=-10);

fitC <- callCopyNeutralRegions(fit, verbose=-10);
print(fitC);

# Normalize
fitN <- normalizeBAFsByRegions(fitC, verbose=-10);

} # if (require("PSCBS"))



