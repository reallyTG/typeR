library(GVARX)


### Name: getCOEF
### Title: Return country-specific standard LS coefficient estimates.
### Aliases: getCOEF

### ** Examples

data("PriceVol")
data("tradeweight1")
data("tradeweightx")
p=2
FLag=2
lag.max=15
type="const"
ic="SC"
weight.matrix=tradeweightx
mainOUTPUT = GVARest(data=PriceVol,p,FLag,lag.max,type,ic,weight.matrix)
COEF=getCOEF(out=mainOUTPUT,sheet=1)




