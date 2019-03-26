library(GVARX)


### Name: getWhiteCOEF
### Title: Extract country-specific LS coefficient estimates with White
###   robust covariance.
### Aliases: getWhiteCOEF

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

COEF=getWhiteCOEF(out=mainOUTPUT,sheet=1)




