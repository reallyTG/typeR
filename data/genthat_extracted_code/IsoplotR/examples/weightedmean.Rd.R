library(IsoplotR)


### Name: weightedmean
### Title: Calculate the weighted mean age
### Aliases: weightedmean weightedmean.default weightedmean.UPb
###   weightedmean.PbPb weightedmean.ThU weightedmean.ArAr weightedmean.KCa
###   weightedmean.ReOs weightedmean.SmNd weightedmean.RbSr
###   weightedmean.LuHf weightedmean.UThHe weightedmean.fissiontracks

### ** Examples

ages <- c(251.9,251.59,251.47,251.35,251.1,251.04,250.79,250.73,251.22,228.43)
errs <- c(0.28,0.28,0.63,0.34,0.28,0.63,0.28,0.4,0.28,0.33)
weightedmean(cbind(ages,errs))

data(examples)
weightedmean(examples$LudwigMean)



