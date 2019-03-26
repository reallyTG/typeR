library(locfit)


### Name: spence.21
### Title: Spencer's 21 point graduation rule.
### Aliases: spence.21
### Keywords: smooth

### ** Examples

 data(spencer)
yy <- spence.21(spencer$mortality)
plot(spencer$age, spencer$mortality)
lines(spencer$age, yy)



