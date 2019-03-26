library(rtsplot)


### Name: rtsplot.y.highlight
### Title: Highlight horizontal segments
### Aliases: rtsplot.y.highlight

### ** Examples

## No test: 
 
# download data
data.spy = getSymbols('SPY', auto.assign = FALSE)
rsi = RSI(Cl(data.spy), 20)
 	
#set up two regions for graphs candlestick price data on top 2/3 of the plot
#and rsi on the bottom 1/3 of the plot
layout(c(1,1,2))  
	
rtsplot(data.spy, type = 'candle', plotX = FALSE)
  rtsplot.legend('SPY', 'grey70', data.spy)
rtsplot(rsi, type = 'l')

col = grDevices::adjustcolor(c('green','red'), 80/255)
rtsplot.y.highlight(col=col[1], highlight=c(50,100))	
rtsplot.y.highlight(col=col[2], highlight=c(0,50))	
	
abline(h = 50, col = 'gray20')

  col = iif(mlast(rsi)>50,'black','red')
rtsplot.legend('RSI(20)', col, rsi, text.col=col)
## End(No test)



