library(IsoplotR)


### Name: peakfit
### Title: Finite mixture modelling of geochronological datasets
### Aliases: peakfit peakfit.default peakfit.fissiontracks peakfit.UPb
###   peakfit.PbPb peakfit.ArAr peakfit.KCa peakfit.ReOs peakfit.SmNd
###   peakfit.RbSr peakfit.LuHf peakfit.ThU peakfit.UThHe

### ** Examples

data(examples)
peakfit(examples$FT1,k=2)

peakfit(examples$LudwigMixture,k='min')



