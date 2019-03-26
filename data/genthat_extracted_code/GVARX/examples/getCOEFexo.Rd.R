library(GVARX)


### Name: getCOEFexo
### Title: All-country LS coefficient estimates.
### Aliases: getCOEFexo

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
#COEF=getCOEFexo(out=mainOUTPUT)



