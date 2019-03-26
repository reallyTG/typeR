library(SpecsVerification)


### Name: CorrDiff
### Title: Calculate correlation difference between a forecast and a
###   reference forecast, and assess uncertainty
### Aliases: CorrDiff

### ** Examples

data(eurotempforecast)
CorrDiff(rowMeans(ens), ens[, 1], obs)



