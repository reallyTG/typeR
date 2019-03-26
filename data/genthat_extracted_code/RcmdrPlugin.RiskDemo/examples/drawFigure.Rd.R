library(RcmdrPlugin.RiskDemo)


### Name: drawFigure
### Title: Efficient frontier and return distribution figures
### Aliases: drawFigure

### ** Examples

data(stockData, package="RcmdrPlugin.RiskDemo")
with(stockData,drawFigure(symbol=rownames(stockData),yield=divYield,
  vol=vol,beta=beta,r=1,total=100,indexVol=10, 
  nStocks=5,balanceInt=12,A=10,riskfree=TRUE,bor=FALSE))



