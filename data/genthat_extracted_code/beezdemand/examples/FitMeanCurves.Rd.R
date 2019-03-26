library(beezdemand)


### Name: FitMeanCurves
### Title: Fit Pooled Curves
### Aliases: FitMeanCurves

### ** Examples

## Fit aggregated data (mean only) using Hursh & Silberberg, 2008 equation with a k fixed at 2
FitMeanCurves(apt[sample(apt$id, 5), ], "hs", k = 2, method = "Mean")



