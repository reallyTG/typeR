library(dimRed)


### Name: plot
### Title: Plotting of dimRed* objects
### Aliases: plot plot.dimRed plot,dimRedData,ANY-method plot.dimRedData
###   plot,dimRedResult,ANY-method plot.dimRedResult

### ** Examples

scurve = loadDataSet("3D S Curve")
plot(scurve, type = "pairs", main = "pairs plot of S curve")
plot(scurve, type = "parpl")
plot(scurve, type = "2vars", vars = c("y", "z"))
plot(scurve, type = "3vars")




