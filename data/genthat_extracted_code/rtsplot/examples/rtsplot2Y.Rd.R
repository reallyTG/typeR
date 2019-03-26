library(rtsplot)


### Name: rtsplot2Y
### Title: Plot time series with second Y axis
### Aliases: rtsplot2Y

### ** Examples

# generate time series data
y = rtsplot.fake.stock.data(1000)
symbol = 'SPY'

y1 = rtsplot.fake.stock.data(1000, 100)
symbol = 'IBM'
	
 # two Y axis example
 # to plot second Y axis, free some space on left side, set LeftMargin=3
 layout(1)
 cols = c('black', 'red')

 rtsplot(y, type = 'l', LeftMargin=3, col=cols[1])
			
 rtsplot2Y(y1, type='l', las=1, col=cols[2], col.axis=cols[2])

 rtsplot.legend('SPY(rhs),IBM(lhs)', cols, list(y,y1))




