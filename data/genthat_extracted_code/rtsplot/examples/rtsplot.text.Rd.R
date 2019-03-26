library(rtsplot)


### Name: rtsplot.text
### Title: Add text to time series plot
### Aliases: rtsplot.text

### ** Examples

y = rtsplot.fake.stock.data(1000)
symbol = 'SPY'
	
 # plot
 layout(1)
 rtsplot(y, type = 'l', col='black')
 rtsplot.text(y[100], 'Text', col='red')
rtsplot.legend(symbol, 'black', y)




