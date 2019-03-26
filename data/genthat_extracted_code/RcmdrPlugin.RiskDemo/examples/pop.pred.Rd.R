library(RcmdrPlugin.RiskDemo)


### Name: pop.pred
### Title: Population forecasting
### Aliases: pop.pred

### ** Examples

data(fin)
data(fin.fcast)
fin.pcast <- pop.pred(fin,fin.fcast)
plot(fin,plot.type="functions",series="total",transform=FALSE,
     datatype="pop",ages=c(0:100), years=c(1990+0:5*10), xlab="Age")
lines(fin.pcast,plot.type="functions",series="total",transform=FALSE, 
      datatype="pop",ages=c(0:100), years=c(1990+0:5*10), lty=2)



