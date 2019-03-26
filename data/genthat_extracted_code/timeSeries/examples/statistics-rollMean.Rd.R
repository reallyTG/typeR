library(timeSeries)


### Name: rollMean
### Title: Rolling Statistics
### Aliases: rollStats rollMean rollMin rollMax rollMedian
### Keywords: chron

### ** Examples

## Use Swiss Pension Fund Data Set of Returns - 
   head(LPP2005REC)
   SPI <- LPP2005REC[, "SPI"]
   head(SPI)
   
## Plot Drawdowns - 
   rmean <- rollMean(SPI, k = 10)
   plot(rmean)



