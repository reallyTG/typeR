library(nlme)


### Name: Pixel
### Title: X-ray pixel intensities over time
### Aliases: Pixel
### Keywords: datasets

### ** Examples

fm1 <- lme(pixel ~ day + I(day^2), data = Pixel,
           random = list(Dog = ~ day, Side = ~ 1))
summary(fm1)
VarCorr(fm1)



