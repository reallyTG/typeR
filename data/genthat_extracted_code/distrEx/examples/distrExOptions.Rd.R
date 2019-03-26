library(distrEx)


### Name: distrExOptions
### Title: Function to change the global variables of the package 'distrEx'
### Aliases: distrExOptions distrExoptions getdistrExOption MCIterations
###   GLIntegrateTruncQuantile GLIntegrateOrder ElowerTruncQuantile
###   EupperTruncQuantile ErelativeTolerance m1dfLowerTruncQuantile
###   m1dfRelativeTolerance m2dfLowerTruncQuantile m2dfRelativeTolerance
###   nDiscretize hSmooth IQR.fac
### Keywords: misc distribution

### ** Examples

distrExOptions()
distrExOptions("ElowerTruncQuantile")
distrExOptions("ElowerTruncQuantile" = 1e-6)
# or
distrExOptions(ElowerTruncQuantile = 1e-6)
getdistrExOption("ElowerTruncQuantile")



