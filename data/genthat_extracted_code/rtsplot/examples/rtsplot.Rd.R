library(rtsplot)


### Name: rtsplot
### Title: 'rtsplot' - Time series plot with base R Graphics.
### Aliases: rtsplot rtsplot-package

### ** Examples

# generate time series data
y = rtsplot.fake.stock.data(1000)
symbol = 'Test'

sma = TTR::SMA(y, 250)
rsi = TTR::RSI(y, 20)	

# plot candles and RSI charts
layout(c(1,1,1,2))
cols = rtsplot.colors(2)
	
rtsplot(y, type = 'l', plotX = FALSE, col=cols[1],lwd=1.5)
	rtsplot.lines(sma, col=cols[2], lwd=1.5)
	rtsplot.legend(c(symbol, 'SMA(250)'), cols[1:2], list(y,sma))
	
# plot rsi
rtsplot(rsi, type = 'l', ylim=c(0,100),
	y.highlight = c(c(0,30), c(70,100)),
	y.highlight.col = grDevices::adjustcolor(c('green','red'), 50/255)
)	
rtsplot.legend('RSI(20)', 'black', rsi)


y = rtsplot.fake.stock.data(1000)
symbol = 'SPY'
	
# simple example
highlight = which(y < 10)

# plot
layout(1)
rtsplot.theme.set(col.x.highlight=grDevices::adjustcolor('orange', 200/255))
		
rtsplot(y, type = 'l', main = symbol, x.highlight = highlight)




