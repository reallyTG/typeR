library(AID)


### Name: confInt.boxcoxfr
### Title: Mean and Confidence Interval for Back Transformed Data
### Aliases: confInt.boxcoxfr
### Keywords: functions

### ** Examples


library(AID)

data(AADT)
attach(AADT)
out <- boxcoxfr(aadt, class)
confInt(out, level = 0.95)



