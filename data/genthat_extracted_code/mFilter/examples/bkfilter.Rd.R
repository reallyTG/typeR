library(mFilter)


### Name: bkfilter
### Title: Baxter-King filter of a time series
### Aliases: bkfilter
### Keywords: ts smooth loess nonparametric

### ** Examples

## library(mFilter)

data(unemp)

opar <- par(no.readonly=TRUE)

unemp.bk <- bkfilter(unemp)
plot(unemp.bk)
unemp.bk1 <- bkfilter(unemp, drift=TRUE)
unemp.bk2 <- bkfilter(unemp, pl=8,pu=40,drift=TRUE)
unemp.bk3 <- bkfilter(unemp, pl=2,pu=60,drift=TRUE)
unemp.bk4 <- bkfilter(unemp, pl=2,pu=40,drift=TRUE)

par(mfrow=c(2,1),mar=c(3,3,2,1),cex=.8)
plot(unemp.bk1$x,
    main="Baxter-King filter of unemployment: Trend, drift=TRUE",
    col=1, ylab="")
lines(unemp.bk1$trend,col=2)
lines(unemp.bk2$trend,col=3)
lines(unemp.bk3$trend,col=4)
lines(unemp.bk4$trend,col=5)
legend("topleft",legend=c("series", "pl=2, pu=32", "pl=8, pu=40",
      "pl=2, pu=60", "pl=2, pu=40"), col=1:5, lty=rep(1,5), ncol=1)

plot(unemp.bk1$cycle,
main="Baxter-King filter of unemployment: Cycle,drift=TRUE",
      col=2, ylab="", ylim=range(unemp.bk3$cycle,na.rm=TRUE))
lines(unemp.bk2$cycle,col=3)
lines(unemp.bk3$cycle,col=4)
lines(unemp.bk4$cycle,col=5)
## legend("topleft",legend=c("pl=2, pu=32", "pl=8, pu=40", "pl=2, pu=60",
## "pl=2, pu=40"), col=1:5, lty=rep(1,5), ncol=1)

par(opar)



