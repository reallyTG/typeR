library(visreg)


### Name: visreg-package
### Title: Visualization of regression models
### Aliases: visreg.package visreg-package
### Keywords: package

### ** Examples

fit <- lm(Ozone ~ Solar.R + Wind + Temp, data=airquality)
visreg(fit, "Wind")



