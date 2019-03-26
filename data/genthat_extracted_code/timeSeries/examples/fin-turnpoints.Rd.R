library(timeSeries)


### Name: turns
### Title: Turning Points of a Time Series
### Aliases: turns turnsStats
### Keywords: chron

### ** Examples

## Load Swiss Equities Series -  
   SPI.RET <- LPP2005REC[, "SPI"]
   head(SPI.RET)

## Cumulate and Smooth the Series -
   SPI <- smoothLowess(cumulated(SPI.RET), f=0.05)
   plot(SPI)
   
## Plot Turn Points Series - 
   SPI.SMOOTH <- SPI[, 2]
   tP <- turns(SPI.SMOOTH)
   plot(tP)
   
## Compute Statistics -
   turnsStats(SPI.SMOOTH)



