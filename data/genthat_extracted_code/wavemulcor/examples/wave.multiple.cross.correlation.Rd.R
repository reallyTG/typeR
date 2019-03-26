library(wavemulcor)


### Name: wave.multiple.cross.correlation
### Title: Wavelet routine for multiple cross-correlation
### Aliases: wave.multiple.cross.correlation wmcc
### Keywords: statistics multivariate cross-correlation wavelet

### ** Examples

## Based on data from Figure 7.9 in Gencay, Selcuk and Whitcher (2001)
## plus one random series.

library(wavemulcor)
data(exchange)
returns <- diff(log(exchange))
returns <- ts(returns, start=1970, freq=12)
wf <- "d4"
J <- 6
lmax <- 36
n <- dim(returns)[1]

demusd.modwt <- modwt(returns[,"DEM.USD"], wf, J)
demusd.modwt.bw <- brick.wall(demusd.modwt, wf)
jpyusd.modwt <- modwt(returns[,"JPY.USD"], wf, J)
jpyusd.modwt.bw <- brick.wall(jpyusd.modwt, wf)
rand.modwt <- modwt(rnorm(length(returns[,"DEM.USD"])), wf, J)
rand.modwt.bw <- brick.wall(rand.modwt, wf)

##xx <- list(demusd.modwt.bw, jpyusd.modwt.bw)
xx <- list(demusd.modwt.bw, jpyusd.modwt.bw, rand.modwt.bw)

Lst <- wave.multiple.cross.correlation(xx, lmax)
returns.cross.cor <- as.matrix(Lst$xy.mulcor[1:J,])
YmaxR <- Lst$YmaxR

exchange.names <- c("DEM.USD", "JPY.USD", "RAND")
rownames(returns.cross.cor)<-rownames(returns.cross.cor,
  do.NULL = FALSE, prefix = "Level ")
lags <- length(-lmax:lmax)

lower.ci <- tanh(atanh(returns.cross.cor) - qnorm(0.975) /
sqrt(matrix(trunc(n/2^(1:J)), nrow=J, ncol=lags)- 3))
upper.ci <- tanh(atanh(returns.cross.cor) + qnorm(0.975) /
sqrt(matrix(trunc(n/2^(1:J)), nrow=J, ncol=lags)- 3))

par(mfrow=c(3,2), las=1, pty="m", mar=c(2,3,1,0)+.1, oma=c(1.2,1.2,0,0))
for(i in J:1) {
matplot((1:(2*lmax+1)),returns.cross.cor[i,], type="l", lty=1, ylim=c(-1,1),
  xaxt="n", xlab="", ylab="", main=rownames(returns.cross.cor)[[i]][1])
if(i<3) {axis(side=1, at=seq(1, 2*lmax+1, by=12),
  labels=seq(-lmax, lmax, by=12))}
#axis(side=2, at=c(-.2, 0, .5, 1))
lines(lower.ci[i,], lty=1, col=2) ##Add Connected Line Segments to a Plot
lines(upper.ci[i,], lty=1, col=2)
abline(h=0,v=lmax+1)              ##Add Straight horiz and vert Lines to a Plot
text(1,1, labels=exchange.names[YmaxR[i]], adj=0.25, cex=.8)
}
par(las=0)
mtext('Lag (months)', side=1, outer=TRUE, adj=0.5)
mtext('Wavelet Multiple Cross-Correlation', side=2, outer=TRUE, adj=0.5)



