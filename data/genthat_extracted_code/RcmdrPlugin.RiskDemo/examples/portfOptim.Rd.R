library(RcmdrPlugin.RiskDemo)


### Name: portfOptim
### Title: Portfolio optimization for an index model
### Aliases: portfOptim

### ** Examples

data(stockData, package="RcmdrPlugin.RiskDemo")
with(stockData,portfOptim(i=1:5,symbol=rownames(stockData),
  yield=divYield/100,vol=vol/100,beta=beta/100,total=100, sim=TRUE))



