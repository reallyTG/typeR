library(nlme)


### Name: gnls
### Title: Fit Nonlinear Model Using Generalized Least Squares
### Aliases: gnls
### Keywords: models

### ** Examples

# variance increases with a power of the absolute fitted values
fm1 <- gnls(weight ~ SSlogis(Time, Asym, xmid, scal), Soybean,
            weights = varPower())
summary(fm1)



