library(nlme)


### Name: logLik.gnls
### Title: Log-Likelihood of a gnls Object
### Aliases: logLik.gnls
### Keywords: models

### ** Examples

fm1 <- gnls(weight ~ SSlogis(Time, Asym, xmid, scal), Soybean,
            weights = varPower())
logLik(fm1)



