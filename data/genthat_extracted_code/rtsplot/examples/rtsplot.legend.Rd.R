library(rtsplot)


### Name: rtsplot.legend
### Title: Plot legend - shortcut to the 'legend' function
### Aliases: rtsplot.legend

### ** Examples

y = rtsplot.fake.stock.data(1000)
symbol = 'SPY'
	
 # plot
 layout(1)
 rtsplot(y, type = 'l', col='black')
rtsplot.legend(symbol, 'black', y)




