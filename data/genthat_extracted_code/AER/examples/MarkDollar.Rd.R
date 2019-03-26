library(AER)


### Name: MarkDollar
### Title: DEM/USD Exchange Rate Returns
### Aliases: MarkDollar
### Keywords: datasets

### ** Examples

library("tseries")
data("MarkDollar")

## GARCH(1,1)
fm <- garch(MarkDollar, grad = "numerical")
summary(fm)
logLik(fm)  



