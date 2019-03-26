library(AID)


### Name: confInt.boxcoxnc
### Title: Mean and Confidence Interval for Back Transformed Data
### Aliases: confInt confInt.boxcoxnc
### Keywords: functions

### ** Examples


library(AID)

data(textile)
out <- boxcoxnc(textile[,1])
confInt(out) # mean and confidence interval for back transformed data




