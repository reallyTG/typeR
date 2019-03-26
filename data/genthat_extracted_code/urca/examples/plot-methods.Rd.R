library(urca)


### Name: plot-methods
### Title: Methods for Function plot in Package urca
### Aliases: plot plot-methods plot,ur.ers,missing-method
###   plot,ur.kpss,missing-method plot,ca.jo,missing-method
###   plot,ca.po,missing-method plot,ur.pp,missing-method
###   plot,ur.sp,missing-method plot,ur.za,missing-method
###   plot,ur.df,missing-method
### Keywords: methods

### ** Examples

data(nporg)
gnp <- na.omit(nporg[, "gnp.r"])
gnp.l <- log(gnp)
#
ers.gnp <- ur.ers(gnp, type="DF-GLS", model="trend", lag.max=4)
plot(ers.gnp)
#
kpss.gnp <- ur.kpss(gnp.l, type="tau", lags="short")
plot(kpss.gnp)
#
pp.gnp <- ur.pp(gnp, type="Z-tau", model="trend", lags="short")
plot(pp.gnp)
#
sp.gnp <- ur.sp(gnp, type="tau", pol.deg=1, signif=0.01)
plot(sp.gnp)
#
za.gnp <- ur.za(gnp, model="both", lag=2)
plot(za.gnp)
#
data(denmark)
sjd <- denmark[, c("LRM", "LRY", "IBO", "IDE")]
sjd.vecm <- ca.jo(sjd, ecdet="const", type="eigen", K=2, season=4)
plot(sjd.vecm)



