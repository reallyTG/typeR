library(QCApro)


### Name: findTh
### Title: Find Calibration Thresholds
### Aliases: findTh
### Keywords: functions

### ** Examples

# 15 random values between 1 and 100 
x <- sample(1:100, size = 15)

# split into two groups for csQCA
findTh(x)

# split into three groups for mvQCA
findTh(x, groups = 3)



