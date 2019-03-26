library(GVARX)


### Name: GVARest
### Title: Estimate country-specific VAR in a GVAR setting
### Aliases: GVARest

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

mainOUTPUT$lagmatrix    # Country-specific GVAR lags
mainOUTPUT$gvar
mainOUTPUT$gvar[[1]]
coef(mainOUTPUT$gvar[[17]])
mainOUTPUT$White[[17]]
mainOUTPUT$NWHAC[[17]][1]




