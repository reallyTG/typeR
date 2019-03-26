## ---- echo=FALSE, eval=TRUE, message=FALSE-------------------------------
library(secr)

## ---- echo=FALSE, eval=TRUE--------------------------------------------------------
options(digits=6, width=85)

## ---- echo = FALSE, eval=TRUE, fig.height=3.5, fig.width=7, cache = TRUE-----------
par(mfrow=c(1,2), pty='s', mar=c(2,1,2,2), cex=1.2, las = 1, bty = 'l',
    xpd=T, cex=1.2, xaxs='i', yaxs='i', lwd=1.5)

plot(sim.popn(D=5, core=make.grid(), buffer=150), cex=1)
plot(make.grid(),add=T, detpar=list(col = "red", pch = 3, cex = 1.2))
text(-160,300,'a.', cex=1.3)

par(mar=c(4,5,2,2))
plot(0,0, type='n', xlim=c(0,800), ylim=c(0,0.15),
   xlab='', ylab='', lwd=2, col='blue', axes = FALSE)
plot(stoat.model.HN, limits=FALSE, xv=0:800, ylim=c(0,0.12),
   xlab='', ylab='', lwd=2, col='blue', add = TRUE)
axis (1)
mtext(side=1, line=2.5, 'Distance  (m)', cex=1.2)
axis (2, at=c(0, 0.05, 0.10, 0.15))
mtext(side=2, line=3.5, 'Detection probability', cex=1.2, las=0)
plot(stoat.model.EX, add=T, limits=F, xv=1:800, col='green', lwd=2)
legend (260,0.15, lwd=2, col=c('blue', 'green'),
    legend=c('halfnormal','exponential'), bty='n')
text(-450, 0.18,'b.', cex=1.3)

## ---- eval=FALSE-------------------------------------------------------------------
#  news (package = "secr")

## ---- eval=FALSE-------------------------------------------------------------------
#  secr.fit(captdata, model = g0~t)

