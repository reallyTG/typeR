library(quantmod)


### Name: OHLC.Transformations
### Title: Extract and Transform OHLC Time-Series Columns
### Aliases: OHLC.Transformations getPrice Ad Cl ClCl Hi HiCl Lo LoCl LoHi
###   Op OpCl OpHi OpLo OpOp Vo HLC OHLC OHLCV seriesHi seriesLo seriesIncr
###   seriesDecr seriesAccel seriesDecel
### Keywords: utilities

### ** Examples

## Not run: 
##D getSymbols('IBM',src='yahoo')
##D Ad(IBM)
##D Cl(IBM)
##D ClCl(IBM)
##D 
##D seriesHi(IBM)
##D seriesHi(Lo(IBM))
##D 
##D removeSymbols('IBM')
## End(Not run)



