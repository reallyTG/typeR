library(mFilter)


### Name: mFilter
### Title: Decomposition of a time series into trend and cyclical
###   components using various filters
### Aliases: mFilter mFilter.default mFilter.ts
### Keywords: ts smooth loess nonparametric

### ** Examples

## library(mFilter)

data(unemp)

opar <- par(no.readonly=TRUE)

unemp.hp <- mFilter(unemp,filter="HP")  # Hodrick-Prescott filter
print(unemp.hp)
summary(unemp.hp)
residuals(unemp.hp)
fitted(unemp.hp)
plot(unemp.hp)

unemp.bk <- mFilter(unemp,filter="BK")  # Baxter-King filter
unemp.cf <- mFilter(unemp,filter="CF")  # Christiano-Fitzgerald filter
unemp.bw <- mFilter(unemp,filter="BW")  # Butterworth filter
unemp.tr <- mFilter(unemp,filter="TR")  # Trigonometric regression filter

par(mfrow=c(2,1),mar=c(3,3,2,1),cex=.8)
plot(unemp,main="Unemployment Series & Estimated Trend", col=1, ylab="")
lines(unemp.hp$trend,col=2)
lines(unemp.bk$trend,col=3)
lines(unemp.cf$trend,col=4)
lines(unemp.bw$trend,col=5)
lines(unemp.tr$trend,col=6)

legend("topleft",legend=c("series", "HP","BK","CF","BW","TR"),
    col=1:6,lty=rep(1,6),ncol=2)

plot(unemp.hp$cycle,main="Estimated Cyclical Component",
     ylim=c(-2,2.5),col=2,ylab="")
lines(unemp.bk$cycle,col=3)
lines(unemp.cf$cycle,col=4)
lines(unemp.bw$cycle,col=5)
lines(unemp.tr$cycle,col=6)
## legend("topleft",legend=c("HP","BK","CF","BW","TR"),
## col=2:6,lty=rep(1,5),ncol=2)

unemp.cf1 <- mFilter(unemp,filter="CF", drift=TRUE, root=TRUE)
unemp.cf2 <- mFilter(unemp,filter="CF", pl=8,pu=40,drift=TRUE, root=TRUE)
unemp.cf3 <- mFilter(unemp,filter="CF", pl=2,pu=60,drift=TRUE, root=TRUE)
unemp.cf4 <- mFilter(unemp,filter="CF", pl=2,pu=40,drift=TRUE,
             root=TRUE,theta=c(.1,.4))

plot(unemp,
main="Christiano-Fitzgerald filter of unemployment: Trend \n root=TRUE,drift=TRUE",
      col=1, ylab="")
lines(unemp.cf1$trend,col=2)
lines(unemp.cf2$trend,col=3)
lines(unemp.cf3$trend,col=4)
lines(unemp.cf4$trend,col=5)
legend("topleft",legend=c("series", "pl=2, pu=32", "pl=8, pu=40",
"pl=2, pu=60", "pl=2, pu=40, theta=.1,.4"), col=1:5, lty=rep(1,5), ncol=1)

plot(unemp.cf1$cycle,
main="Christiano-Fitzgerald filter of unemployment: Cycle \n root=TRUE,drift=TRUE",
     col=2, ylab="", ylim=range(unemp.cf3$cycle))
lines(unemp.cf2$cycle,col=3)
lines(unemp.cf3$cycle,col=4)
lines(unemp.cf4$cycle,col=5)
## legend("topleft",legend=c("pl=2, pu=32", "pl=8, pu=40", "pl=2, pu=60",
## "pl=2, pu=40, theta=.1,.4"), col=2:5, lty=rep(1,4), ncol=2)

par(opar)



