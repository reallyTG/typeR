library(pastecs)


### Name: local.trend
### Title: Calculate local trends using cumsum
### Aliases: local.trend identify.local.trend
### Keywords: ts

### ** Examples

data(bnr)
# Calculate and plot cumsum for the 8th series
bnr8.lt <- local.trend(bnr[,8])
# To identify local trends, use:
# identify(bnr8.lt)
# and click points between which you want to compute local linear trends...



