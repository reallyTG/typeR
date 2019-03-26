library(locfit)


### Name: spence.15
### Title: Spencer's 15 point graduation rule.
### Aliases: spence.15
### Keywords: smooth

### ** Examples

data(spencer)
yy <- spence.15(spencer$mortality)
plot(spencer$age, spencer$mortality)
lines(spencer$age, yy)



