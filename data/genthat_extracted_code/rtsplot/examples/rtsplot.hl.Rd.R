library(rtsplot)


### Name: rtsplot.hl
### Title: Create HL Plot
### Aliases: rtsplot.hl

### ** Examples

y = rtsplot.fake.stock.data(100, ohlc=TRUE)
symbol = 'SPY'
	
 # plot
 layout(1)
 rtsplot(y, type = 'n')
 rtsplot.hl(y)
rtsplot.legend(symbol, 'black', y)




