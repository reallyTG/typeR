library(HH)


### Name: tsdiagplot
### Title: Times series diagnostic plots for a structured set of ARIMA
###   models.
### Aliases: tsdiagplot acfplot aicsigplot residplot gofplot
### Keywords: hplot

### ** Examples

data(tser.mystery.X)
X <- tser.mystery.X

X.dataplot <- tsacfplots(X, lwd=1, pch.seq=16, cex=.7)
X.dataplot

X.loop <- if.R(
               s=
               arma.loop(X, model=list(order=c(2,0,2)))
               ,r=
               arma.loop(X, order=c(2,0,2))
               )
X.dal <- diag.arma.loop(X.loop, x=X)
X.diag <- rearrange.diag.arma.loop(X.dal)
X.diagplot <- tsdiagplot(armas=X.loop, ts.diag=X.diag, lwd=1)
X.diagplot

X.loop
X.loop[["1","1"]]



