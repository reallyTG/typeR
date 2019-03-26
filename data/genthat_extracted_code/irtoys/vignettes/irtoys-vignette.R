## ---- message=FALSE------------------------------------------------------
library(irtoys)

## ---- fig.show='hold', fig.height=4, fig.width=5-------------------------
plot(irf(b1, items=3), main="IRF for item 3", co=2)
plot(irf(b2, items=3), co=3, add=TRUE)
plot(irf(b3, items=3), co=4, add=TRUE)

plot(irf(b1, items=13), main="IRF for item 13", co=2)
plot(irf(b2, items=13), co=3, add=TRUE)
plot(irf(b3, items=13), co=4, add=TRUE)

## ---- fig.show='hold', fig.height=4, fig.width=5-------------------------
x = qrs(Scored)
irfPlot(Scored, b1, x=x, item=3, main="1PL")
irfPlot(Scored, b2, x=x, item=3, main="2PL")
irfPlot(Scored, b3, x=x, item=3, main="3PL")

## ------------------------------------------------------------------------
qrs

## ------------------------------------------------------------------------
ramsay = qrs(Scored)
warm = wle(Scored, b2)[,1]
cor(ramsay, warm)

## ------------------------------------------------------------------------
cor (warm, wle(Scored, b1)[,1])

## ---- fig.height=4, fig.width=5------------------------------------------
npp(Scored, ramsay, 3, co=2, main="Item3", bands=TRUE)
plot(irf(b1, items=3), co=1, add=TRUE)
plot(irf(b2, items=3), co=3, add=TRUE)
plot(irf(b3, items=3), co=4, add=TRUE)

## ---- fig.height=4, fig.width=5------------------------------------------
keys = c(2,3,1,1,4,1,2,1,2,3,3,4,3,4,2,2,4,3)
tgf(choices=Unscored, key=keys, item=1, co=NA, label=TRUE, main="Item 1")

## ---- fig.show='hold', fig.height=4, fig.width=5-------------------------
p1 = scoreMetric(b1)
p2 = scoreMetric(b2)
p3 = scoreMetric(b3)

plot(0:ncol(Scored),  p1$f[,3], col=1, lwd=2, type="l", main="Item 3", 
     xlab="Sum score", ylab="Probability")
lines(0:ncol(Scored), p2$f[,3], co=3, lw=2)
lines(0:ncol(Scored), p3$f[,3], co=4, lw=2)

plot(0:ncol(Scored),  p1$f[,1], col=1, lwd=2, type="l", main="Item 1", 
     xlab="Sum score", ylab="Probability")
lines(0:ncol(Scored), p2$f[,1], co=3, lw=2)
lines(0:ncol(Scored), p3$f[,1], co=4, lw=2)

## ---- fig.show='hold', fig.height=8, fig.width=5-------------------------
rim(Scored, items=c(3,1), ncol=1, shade=0, show=TRUE)

## ---- fig.show='hold', fig.height=8, fig.width=5-------------------------
rim(Scored, items=c(3,1), ncol=1)

## ---- fig.height=5, fig.width=7------------------------------------------
flat = 1 + (b2$est[,1] < .8)
plot(irf(b2), items=steep, label=TRUE, main="IRF for the 2PL model", co=flat, lw=1)

## ---- fig.height=5, fig.width=7------------------------------------------
plot(interactionModel(Scored), highlight=-.03, label=TRUE)

