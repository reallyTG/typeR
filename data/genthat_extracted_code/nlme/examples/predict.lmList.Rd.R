library(nlme)


### Name: predict.lmList
### Title: Predictions from an lmList Object
### Aliases: predict.lmList
### Keywords: models

### ** Examples

fm1 <- lmList(distance ~ age | Subject, Orthodont)
predict(fm1, se.fit = TRUE)



