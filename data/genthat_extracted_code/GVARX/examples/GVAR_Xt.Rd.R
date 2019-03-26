library(GVARX)


### Name: GVAR_Xt
### Title: Compute the G0, G1, G2, and F1, F2 matrices for filtering Xt
### Aliases: GVAR_Xt

### ** Examples

data("PriceVol")
data("tradeweightx")
data("tradeweight1")
p=2
FLag=2
lag.max=15
type="const"
ic="SC"
weight.matrix=tradeweightx

Result=GVAR_Xt(data=PriceVol,p,FLag,lag.max,type,ic, weight.matrix)
Result$G0
Result$G1
#Result$F1
Result$lagmatrix
Result$newRESID




