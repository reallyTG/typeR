library(GVARX)


### Name: grangerGVAR
### Title: Granger Causality for bivariate vector autoregression model
###   augmented by foreign variables
### Aliases: grangerGVAR

### ** Examples

data("PriceVol")
data("tradeweight1")
data("tradeweightx")

p=2
FLag=2
type="const"
lag.max=15
ic="SC"
weight.matrix=tradeweightx

GC_OUTPUT = grangerGVAR(data=PriceVol, p, FLag, type, lag.max, ic, weight.matrix)

# VAR:y1(Price) does NOT Granger Casuse y2 (logVol)
round(GC_OUTPUT$y1GCy2.var, 4)

# VAR: y2(logVol) does NOT Granger Casuse y1 (Price)
round(GC_OUTPUT$y2GCy1.var, 4)

# GVAR: y1(Price) does NOT Granger Casuse y2 (logVol)
round(GC_OUTPUT$y1GCy2.gvar, 4)

# GVAR: y2(logVol) does NOT Granger Casuse y1 (Price)
round(GC_OUTPUT$y2GCy1.gvar, 4)





