library(nlme)


### Name: coef.gnls
### Title: Extract gnls Coefficients
### Aliases: coef.gnls
### Keywords: models

### ** Examples

fm1 <- gnls(weight ~ SSlogis(Time, Asym, xmid, scal), Soybean,
            weights = varPower())
coef(fm1)



