library(mFilter)


### Name: trfilter
### Title: Trigonometric regression filter of a time series
### Aliases: trfilter
### Keywords: ts smooth loess nonparametric

### ** Examples

## library(mFilter)

data(unemp)

opar <- par(no.readonly=TRUE)

unemp.tr <- trfilter(unemp, drift=TRUE)
plot(unemp.tr)
unemp.tr1 <- trfilter(unemp, drift=TRUE)
unemp.tr2 <- trfilter(unemp, pl=8,pu=40,drift=TRUE)
unemp.tr3 <- trfilter(unemp, pl=2,pu=60,drift=TRUE)
unemp.tr4 <- trfilter(unemp, pl=2,pu=40,drift=TRUE)

par(mfrow=c(2,1),mar=c(3,3,2,1),cex=.8)
plot(unemp.tr1$x,
main="Trigonometric regression filter of unemployment: Trend, drift=TRUE",
     col=1, ylab="")
lines(unemp.tr1$trend,col=2)
lines(unemp.tr2$trend,col=3)
lines(unemp.tr3$trend,col=4)
lines(unemp.tr4$trend,col=5)
legend("topleft",legend=c("series", "pl=2, pu=32", "pl=8, pu=40",
"pl=2, pu=60", "pl=2, pu=40"), col=1:5, lty=rep(1,5), ncol=1)

plot(unemp.tr1$cycle,
main="Trigonometric regression filter of unemployment: Cycle,drift=TRUE",
     col=2, ylab="", ylim=range(unemp.tr3$cycle,na.rm=TRUE))
lines(unemp.tr2$cycle,col=3)
lines(unemp.tr3$cycle,col=4)
lines(unemp.tr4$cycle,col=5)
## legend("topleft",legend=c("pl=2, pu=32", "pl=8, pu=40", "pl=2, pu=60",
## "pl=2, pu=40"), col=1:5, lty=rep(1,5), ncol=1)

par(opar)



