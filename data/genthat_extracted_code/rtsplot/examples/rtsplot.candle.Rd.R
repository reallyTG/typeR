library(rtsplot)


### Name: rtsplot.candle
### Title: Create Candle Plot
### Aliases: rtsplot.candle

### ** Examples

y = rtsplot.fake.stock.data(100, ohlc=TRUE)
symbol = 'SPY'
	
 # plot
 layout(1)
 rtsplot(y, type = 'n')
 rtsplot.candle(y)
rtsplot.legend(symbol, 'black', y)




