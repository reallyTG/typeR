library(quantmod)


### Name: newTA
### Title: Create A New TA Indicator For chartSeries
### Aliases: newTA addTA chartTA
### Keywords: aplot dplot hplot

### ** Examples

## Not run: 
##D getSymbols('SBUX')
##D barChart(SBUX)
##D addTA(EMA(Cl(SBUX)), on=1, col=6)
##D addTA(OpCl(SBUX), col=4, type='b', lwd=2)
##D # create new EMA TA function
##D newEMA <- newTA(EMA, Cl, on=1, col=7)
##D newEMA()
##D newEMA(on=NA, col=5)
## End(Not run)



