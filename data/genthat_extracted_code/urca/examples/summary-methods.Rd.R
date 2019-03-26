library(urca)


### Name: summary-methods
### Title: Methods for Function summary in Package 'urca'
### Aliases: summary summary-methods summary,ur.ers-method
###   summary,ur.kpss-method summary,ca.jo-method summary,cajo.test-method
###   summary,ca.po-method summary,ur.pp-method summary,ur.df-method
###   summary,ur.sp-method summary,ur.za-method
### Keywords: methods

### ** Examples

data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
gnp.l <- log(gnp)
#
ers.gnp <- ur.ers(gnp, type="DF-GLS", model="trend", lag.max=4)
summary(ers.gnp)
#
kpss.gnp <- ur.kpss(gnp.l, type="tau", lags="short")
summary(kpss.gnp)
#
pp.gnp <- ur.pp(gnp, type="Z-tau", model="trend", lags="short")
summary(pp.gnp)
#
df.gnp <- ur.df(gnp, type="trend", lags=4)
summary(df.gnp)
#
sp.gnp <- ur.sp(gnp, type="tau", pol.deg=1, signif=0.01)
summary(sp.gnp)
#
za.gnp <- ur.za(gnp, model="both", lag=2)
summary(za.gnp)
#
data(finland)
sjf <- finland
sjf.vecm <- ca.jo(sjf, ecdet="none", type="eigen", K=2, season=4)
summary(sjf.vecm)
#
HF0 <- matrix(c(-1, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1), c(4,3))
summary(blrtest(sjf.vecm, H=HF0, r=3))



