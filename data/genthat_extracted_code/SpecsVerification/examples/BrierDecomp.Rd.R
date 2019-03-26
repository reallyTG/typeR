library(SpecsVerification)


### Name: BrierDecomp
### Title: Brier Score decomposition
### Aliases: BrierDecomp BrierScoreDecomposition

### ** Examples

data(eurotempforecast)
BrierDecomp(rowMeans(ens.bin), obs.bin, bins=3, bias.corrected=TRUE)



