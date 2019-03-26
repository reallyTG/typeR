library(beezdemand)


### Name: PlotCurve
### Title: Plot Curve
### Aliases: PlotCurve

### ** Examples

## Creates a single plot from elements of an object created by FitCurves
## No test: 
fc <- FitCurves(apt, "hs", k = 2, detailed = TRUE)
PlotCurve(fc$adfs[[1]], fc$dfres[1, ], fc$newdats[[1]])
## End(No test)



