library(rcompanion)


### Name: plotNormalHistogram
### Title: Histogram with a normal curve
### Aliases: plotNormalHistogram

### ** Examples

### Plot of residuals from a model fit with lm
data(Catbus)
model = lm(Steps ~ Sex + Teacher,
           data = Catbus)
 plotNormalHistogram(residuals(model))          




