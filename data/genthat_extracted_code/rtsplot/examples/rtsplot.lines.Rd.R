library(rtsplot)


### Name: rtsplot.lines
### Title: Add lines to time series plot
### Aliases: rtsplot.lines

### ** Examples

y = rtsplot.fake.stock.data(1000)
symbol = 'SPY'
	
 # moving average
sma = TTR::SMA(y, 250)

 # plot
 layout(1)
 rtsplot(y, type = 'l', col='black')
 rtsplot.lines(sma, col='blue', lwd=1.5)
rtsplot.legend(c(symbol, 'SMA(250)'), 'black,blue', list(y,sma))




