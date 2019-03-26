library(gplots)


### Name: qqnorm.aov
### Title: Makes a half or full normal plot for the effects from an aov
###   model
### Aliases: qqnorm.aov
### Keywords: hplot design

### ** Examples

library(MASS)
data(npk)
npk.aov <- aov(yield ~ block + N*P*K, npk)
qqnorm(npk.aov)

## interactive labeling of points.  Click mouse on points to show label.
if (dev.interactive()) qqnorm(npk.aov, omit=2:6, label=TRUE)



