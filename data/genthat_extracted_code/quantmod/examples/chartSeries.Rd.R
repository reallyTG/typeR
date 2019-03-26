library(quantmod)


### Name: chartSeries
### Title: Create Financial Charts
### Aliases: chartSeries barChart candleChart matchChart lineChart reChart
###   current.chob
### Keywords: utilities

### ** Examples

## Not run: 
##D getSymbols("YHOO")
##D chartSeries(YHOO)
##D chartSeries(YHOO, subset='last 4 months')
##D chartSeries(YHOO, subset='2007::2008-01')
##D chartSeries(YHOO,theme=chartTheme('white'))
##D chartSeries(YHOO,TA=NULL)   #no volume
##D chartSeries(YHOO,TA=c(addVo(),addBBands()))  #add volume and Bollinger Bands from TTR
##D 
##D addMACD()   #  add MACD indicator to current chart
##D 
##D setTA()
##D chartSeries(YHOO)   #draws chart again, this time will all indicators present
## End(Not run)



