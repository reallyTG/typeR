library(bfast)


### Name: bfast01classify
### Title: Change type analysis of the bfast01 function
### Aliases: bfast01classify
### Keywords: ts,bfast01

### ** Examples

library(zoo)
## define a regular time series
ndvi <- as.ts(zoo(som$NDVI.a, som$Time))
## fit variations
bf1 <- bfast01(ndvi)
bfast01classify(bf1, pct_stable = 0.25)



