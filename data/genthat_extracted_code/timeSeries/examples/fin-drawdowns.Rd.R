library(timeSeries)


### Name: drawdowns
### Title: Calculations of Drawdowns
### Aliases: drawdowns drawdownsStats
### Keywords: chron

### ** Examples

## Use Swiss Pension Fund Data Set of Returns - 
   head(LPP2005REC)
   SPI <- LPP2005REC[, "SPI"]
   head(SPI)
   
## Plot Drawdowns - 
   dd = drawdowns(LPP2005REC[, "SPI"], main = "Drawdowns")
   plot(dd)
   dd = drawdowns(LPP2005REC[, 1:6], main = "Drawdowns")
   plot(dd)

## Compute Drawdowns Statistics - 
   ddStats <- drawdownsStats(SPI)
   class(ddStats)
   ddStats
   
## Note, Only Univariate Series are allowd -
   ddStats <- try(drawdownsStats(LPP2005REC))
   class(ddStats)



