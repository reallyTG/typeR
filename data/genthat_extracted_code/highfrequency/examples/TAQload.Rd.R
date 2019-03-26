library(highfrequency)


### Name: TAQLoad
### Title: Load trade or quote data into R
### Aliases: TAQLoad
### Keywords: data manipulation

### ** Examples

#In order for these examples to work, the folder datasource 
#should contain two folders named 2008-01-02 and 2008-01-03.
#These folder contain the files with the trade data,
#which are named "AAPL_trades.RData" or "AA_trades.RData".

from="2008-01-02";
to = "2008-01-03";
## Not run: datasource="C:\data";

#TAQLoad: load data for stock AAPL
## Not run: 
##D xx = TAQLoad(tickers="AAPL",from,to,trades=TRUE,quotes=FALSE,
##D datasource=datasource,variables=NULL)
## End(Not run)

#Load only price data for stocks AA and AAPL
## Not run: 
##D xx = TAQLoad(tickers=c("AA","AAPL"),from,to,trades=TRUE,
##D quotes=FALSE,datasource=datasource,variables="PRICE")
## End(Not run)                                                                                                



