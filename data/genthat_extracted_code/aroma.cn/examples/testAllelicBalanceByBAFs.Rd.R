library(aroma.cn)


### Name: testAllelicBalanceByBAFs
### Title: Tests for allelic balance in a genomic region
### Aliases: testAllelicBalanceByBAFs.default testAllelicBalanceByBAFs
### Keywords: internal

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



