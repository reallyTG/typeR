library(rcompanion)


### Name: plotDensityHistogram
### Title: Histogram with a density curve
### Aliases: plotDensityHistogram

### ** Examples

### Plot of residuals from a model fit with lm
data(Catbus)
model = lm(Steps ~ Sex + Teacher,
           data = Catbus)
plotDensityHistogram(residuals(model))          




