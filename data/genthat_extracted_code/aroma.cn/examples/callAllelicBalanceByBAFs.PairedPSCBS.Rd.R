library(aroma.cn)


### Name: callAllelicBalanceByBAFs.PairedPSCBS
### Title: Calls regions that are in allelic balance
### Aliases: callAllelicBalanceByBAFs.PairedPSCBS
###   PairedPSCBS.callAllelicBalanceByBAFs
###   callAllelicBalanceByBAFs,PairedPSCBS-method
### Keywords: internal methods

### ** Examples


if (Sys.getenv("_R_CHECK_FULL_") != "" && require("PSCBS")) {

# Load example ASCN data
data <- PSCBS::exampleData("paired.chr01");

# PSCBS segmentation
fit <- segmentByPairedPSCBS(data, verbose=-10);

# Normalize
fitN <- normalizeBAFsByRegions(fit, verbose=-10);

fitN2 <- callAllelicBalanceByBAFs(fitN, verbose=-10);
print(fitN2);

} # if (require("PSCBS"))



