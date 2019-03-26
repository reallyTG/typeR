library(urca)


### Name: show-methods
### Title: Methods for Function show in Package 'urca'
### Aliases: show show-methods show,ur.ers-method show,ur.kpss-method
###   show,ca.jo-method show,ca.po-method show,cajo.test-method
###   show,ur.pp-method show,ur.df-method show,ur.sp-method
###   show,ur.za-method show,sumurca-method
### Keywords: methods

### ** Examples

data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
gnp.l <- log(gnp)
#
ers.gnp <- ur.ers(gnp, type="DF-GLS", model="trend", lag.max=4)
show(ers.gnp)
#
kpss.gnp <- ur.kpss(gnp.l, type="tau", lags="short")
show(kpss.gnp)
#
pp.gnp <- ur.pp(gnp, type="Z-tau", model="trend", lags="short")
show(pp.gnp)
#
df.gnp <- ur.df(gnp, type="trend", lags=4)
show(df.gnp)
#
sp.gnp <- ur.sp(gnp, type="tau", pol.deg=1, signif=0.01)
show(sp.gnp)
#
za.gnp <- ur.za(gnp, model="both", lag=2)
show(za.gnp)
#
data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm <- ca.jo(sjd, ecdet = "const", type="eigen", K=2, season=4)
show(sjd.vecm)
#
HD0 <- matrix(c(-1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1), c(5,4))
show(blrtest(sjd.vecm, H=HD0, r=1))



