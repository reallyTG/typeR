library(rcompanion)


### Name: plotNormalDensity
### Title: Density plot with a normal curve
### Aliases: plotNormalDensity

### ** Examples

### Plot of residuals from a model fit with lm
data(Catbus)
model = lm(Steps ~ Sex + Teacher,
           data = Catbus)
 plotNormalDensity(residuals(model))          




