library(quantmod)


### Name: Next
### Title: Advance a Time Series
### Aliases: Next Next.quantmod.OHLC Next.zoo Next.data.frame Next.numeric
### Keywords: misc datagen

### ** Examples

Stock.Close <- c(102.12,102.62,100.12,103.00,103.87,103.12,105.12)
Close.Dates <- as.Date(c(10660,10661,10662,10665,10666,10667,10668),origin="1970-01-01")
Stock.Close <- zoo(Stock.Close,Close.Dates)

Next(Stock.Close)       #one period ahead
Next(Stock.Close,k=1)   #same

merge(Next(Stock.Close),Stock.Close)

## Not run: 
##D # a simple way to build a model of next days
##D # IBM close, given todays. Technically both
##D # methods are equal, though the former is seen
##D # as more intuitive...ymmv
##D specifyModel(Next(Cl(IBM)) ~ Cl(IBM))
##D specifyModel(Cl(IBM) ~ Lag(Cl(IBM)))
## End(Not run)



