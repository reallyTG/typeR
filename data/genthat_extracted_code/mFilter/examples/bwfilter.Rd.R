library(mFilter)


### Name: bwfilter
### Title: Butterworth filter of a time series
### Aliases: bwfilter
### Keywords: ts smooth loess nonparametric

### ** Examples

## library(mFilter)

data(unemp)

opar <- par(no.readonly=TRUE)

unemp.bw <- bwfilter(unemp)
plot(unemp.bw)
unemp.bw1 <- bwfilter(unemp, drift=TRUE)
unemp.bw2 <- bwfilter(unemp, freq=8,drift=TRUE)
unemp.bw3 <- bwfilter(unemp, freq=10, nfix=3, drift=TRUE)
unemp.bw4 <- bwfilter(unemp, freq=10, nfix=4, drift=TRUE)

par(mfrow=c(2,1),mar=c(3,3,2,1),cex=.8)
plot(unemp.bw1$x,
     main="Butterworth filter of unemployment: Trend,
     drift=TRUE",col=1, ylab="")
lines(unemp.bw1$trend,col=2)
lines(unemp.bw2$trend,col=3)
lines(unemp.bw3$trend,col=4)
lines(unemp.bw4$trend,col=5)
legend("topleft",legend=c("series", "freq=10, nfix=2",
       "freq=8, nfix=2", "freq=10, nfix=3", "freq=10, nfix=4"),
       col=1:5, lty=rep(1,5), ncol=1)

plot(unemp.bw1$cycle,
     main="Butterworth filter of unemployment: Cycle,drift=TRUE",
     col=2, ylab="", ylim=range(unemp.bw3$cycle,na.rm=TRUE))
lines(unemp.bw2$cycle,col=3)
lines(unemp.bw3$cycle,col=4)
lines(unemp.bw4$cycle,col=5)
## legend("topleft",legend=c("series", "freq=10, nfix=2", "freq=8,
## nfix=2", "freq## =10, nfix=3", "freq=10, nfix=4"), col=1:5,
## lty=rep(1,5), ncol=1)

par(opar)



