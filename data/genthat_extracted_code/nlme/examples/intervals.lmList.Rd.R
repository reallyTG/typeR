library(nlme)


### Name: intervals.lmList
### Title: Confidence Intervals on lmList Coefficients
### Aliases: intervals.lmList print.intervals.lmList
### Keywords: models

### ** Examples

fm1 <- lmList(distance ~ age | Subject, Orthodont)
intervals(fm1)



