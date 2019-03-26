library(rtsplot)


### Name: rtsplot.ohlc
### Title: Create OHLC Plot
### Aliases: rtsplot.ohlc

### ** Examples

y = rtsplot.fake.stock.data(100, ohlc=TRUE)
symbol = 'SPY'
	
 # plot
 layout(1)
 rtsplot(y, type = 'n')
 rtsplot.ohlc(y)
rtsplot.legend(symbol, 'black', y)




