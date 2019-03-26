library(SpecsVerification)


### Name: AucDiff
### Title: Calculate difference between areas under the ROC curve (AUC)
###   between a forecast and a reference forecast for the same observation,
###   and estimate the variance of the AUC difference
### Aliases: AucDiff

### ** Examples

data(eurotempforecast)
AucDiff(rowMeans(ens.bin), ens.bin[, 1], obs.bin)



