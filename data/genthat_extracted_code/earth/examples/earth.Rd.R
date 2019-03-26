library(earth)


### Name: earth
### Title: Multivariate Adaptive Regression Splines
### Aliases: earth earth.default earth.formula earth.fit
### Keywords: smooth models regression

### ** Examples

earth.mod <- earth(Volume ~ ., data = trees)
plotmo(earth.mod)
summary(earth.mod, digits = 2, style = "pmax")



