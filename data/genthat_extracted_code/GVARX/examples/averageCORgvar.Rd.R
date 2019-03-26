library(GVARX)


### Name: averageCORgvar
### Title: Comparing average residual correlations.
### Aliases: averageCORgvar

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

cor2_avg=averageCORgvar(out=mainOUTPUT)
as.matrix((cor2_avg$varRSDcor)[[1]])
as.matrix((cor2_avg$varRSDcor)[[2]])

as.matrix(cor2_avg$gvarRSDcor[[1]])
as.matrix(cor2_avg$gvarRSDcor[[2]])




