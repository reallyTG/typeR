library(mFilter)


### Name: hpfilter
### Title: Hodrick-Prescott filter of a time series
### Aliases: hpfilter
### Keywords: ts smooth loess nonparametric

### ** Examples

## library(mFilter)

data(unemp)

opar <- par(no.readonly=TRUE)

unemp.hp <- hpfilter(unemp)
plot(unemp.hp)
unemp.hp1 <- hpfilter(unemp, drift=TRUE)
unemp.hp2 <- hpfilter(unemp, freq=800, drift=TRUE)
unemp.hp3 <- hpfilter(unemp, freq=12,type="frequency",drift=TRUE)
unemp.hp4 <- hpfilter(unemp, freq=52,type="frequency",drift=TRUE)

par(mfrow=c(2,1),mar=c(3,3,2,1),cex=.8)
plot(unemp.hp1$x,  ylim=c(2,13),
main="Hodrick-Prescott filter of unemployment: Trend, drift=TRUE",
     col=1, ylab="")
lines(unemp.hp1$trend,col=2)
lines(unemp.hp2$trend,col=3)
lines(unemp.hp3$trend,col=4)
lines(unemp.hp4$trend,col=5)
legend("topleft",legend=c("series", "lambda=1600", "lambda=800",
       "freq=12", "freq=52"), col=1:5, lty=rep(1,5), ncol=1)

plot(unemp.hp1$cycle,
main="Hodrick-Prescott filter of unemployment: Cycle,drift=TRUE",
     col=2, ylab="", ylim=range(unemp.hp4$cycle,na.rm=TRUE))
lines(unemp.hp2$cycle,col=3)
lines(unemp.hp3$cycle,col=4)
lines(unemp.hp4$cycle,col=5)
## legend("topleft",legend=c("lambda=1600", "lambda=800",
## "freq=12", "freq=52"), col=1:5, lty=rep(1,5), ncol=1)

par(opar)



