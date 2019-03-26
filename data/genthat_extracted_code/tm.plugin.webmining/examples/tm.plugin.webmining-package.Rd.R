library(tm.plugin.webmining)


### Name: tm.plugin.webmining-package
### Title: Retrieve structured, textual data from various web sources
### Aliases: tm.plugin.webmining tm.plugin.webmining-package webmining
### Keywords: package

### ** Examples

## Not run: 
##D googlefinance <- WebCorpus(GoogleFinanceSource("NASDAQ:MSFT"))
##D googlenews <- WebCorpus(GoogleNewsSource("Microsoft"))
##D nytimes <- WebCorpus(NYTimesSource("Microsoft", appid = nytimes_appid))
##D reutersnews <- WebCorpus(ReutersNewsSource("businessNews"))
##D yahoofinance <- WebCorpus(YahooFinanceSource("MSFT"))
##D yahooinplay <- WebCorpus(YahooInplaySource())
##D yahoonews <- WebCorpus(YahooNewsSource("Microsoft"))
## End(Not run)



