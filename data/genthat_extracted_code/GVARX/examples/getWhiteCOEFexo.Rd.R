library(GVARX)


### Name: getWhiteCOEFexo
### Title: Extract all-country coefficient estimates with White robust
###   covariance.
### Aliases: getWhiteCOEFexo

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
COEF=getWhiteCOEFexo(out=mainOUTPUT)



