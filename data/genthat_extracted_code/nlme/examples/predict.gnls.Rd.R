library(nlme)


### Name: predict.gnls
### Title: Predictions from a gnls Object
### Aliases: predict.gnls
### Keywords: models

### ** Examples

fm1 <- gnls(weight ~ SSlogis(Time, Asym, xmid, scal), Soybean,
            weights = varPower())
newSoybean <- data.frame(Time = c(10,30,50,80,100))
predict(fm1, newSoybean)



