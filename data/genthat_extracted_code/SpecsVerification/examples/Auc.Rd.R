library(SpecsVerification)


### Name: Auc
### Title: Calculate area under the ROC curve (AUC) for a forecast and its
###   verifying binary observation, and estimate the variance of the AUC
### Aliases: Auc

### ** Examples

data(eurotempforecast)
Auc(rowMeans(ens.bin), obs.bin)



