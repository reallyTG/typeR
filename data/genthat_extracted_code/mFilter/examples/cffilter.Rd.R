library(mFilter)


### Name: cffilter
### Title: Christiano-Fitzgerald filter of a time series
### Aliases: cffilter
### Keywords: ts smooth loess nonparametric

### ** Examples

## library(mFilter)

data(unemp)

opar <- par(no.readonly=TRUE)

unemp.cf <- cffilter(unemp)
plot(unemp.cf)
unemp.cf1 <- cffilter(unemp, drift=TRUE, root=TRUE)
unemp.cf2 <- cffilter(unemp, pl=8,pu=40,drift=TRUE, root=TRUE)
unemp.cf3 <- cffilter(unemp, pl=2,pu=60,drift=TRUE, root=TRUE)
unemp.cf4 <- cffilter(unemp, pl=2,pu=40,drift=TRUE, root=TRUE,theta=c(.1,.4))

par(mfrow=c(2,1),mar=c(3,3,2,1),cex=.8)
plot(unemp.cf1$x,
main="Christiano-Fitzgerald filter of unemployment: Trend \n root=TRUE,drift=TRUE",
col=1, ylab="")
lines(unemp.cf1$trend,col=2)
lines(unemp.cf2$trend,col=3)
lines(unemp.cf3$trend,col=4)
lines(unemp.cf4$trend,col=5)
legend("topleft",legend=c("series", "pl=2, pu=32", "pl=8, pu=40", "pl=2, pu=60",
"pl=2, pu=40, theta=.1,.4"), col=1:5, lty=rep(1,5), ncol=1)

plot(unemp.cf1$cycle,
main="Christiano-Fitzgerald filter of unemployment: Cycle \n root=TRUE,drift=TRUE",
col=2, ylab="", ylim=range(unemp.cf3$cycle))
lines(unemp.cf2$cycle,col=3)
lines(unemp.cf3$cycle,col=4)
lines(unemp.cf4$cycle,col=5)
## legend("topleft",legend=c("pl=2, pu=32", "pl=8, pu=40", "pl=2, pu=60",
## "pl=2, pu=40, theta=.1,.4"), col=2:5, lty=rep(1,4), ncol=2)

par(opar)



