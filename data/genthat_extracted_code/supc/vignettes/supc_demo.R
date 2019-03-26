## ----library-------------------------------------------------------------
library(supc)

## ----fig.width=6, fig.height=6-------------------------------------------
data(shape)
x=as.matrix(shape[,1:2])
plot(x, main="Example 1 Data")

## ------------------------------------------------------------------------
x.freq <- freq.poly(x, breaks = 100)
tmp=cbind(dist=x.freq$mids[-1], freq=x.freq$count[-1], diff=diff(x.freq$count))
tmp[tmp[,3]<0,][1:5,]
abline(v=c(0.51, 0.73, 0.85), lty=2)


## ------------------------------------------------------------------------
x.supcs <- supc1(x, r=c(0.40, 0.51, 0.73, 0.85), t = "dynamic")

## ----fig.width=10, fig.height=10-----------------------------------------
par(mfrow=c(2,2))
for (i in 1:4)
plot(x, col=x.supcs$cluster[[i]], main=paste("r=", x.supcs$r[[i]], sep=""))


## ----fig.width=6, fig.height=6-------------------------------------------
data(D31)
x=as.matrix(D31[,1:2])
plot(x, main="Example 2 Data")

## ------------------------------------------------------------------------
x.freq <- freq.poly(x, breaks = 100)
tmp=cbind(dist=x.freq$mids[-1], freq=x.freq$count[-1], diff=diff(x.freq$count))
tmp[tmp[,3]<0,][1:5,]
abline(v=2.25, lty=2)


## ------------------------------------------------------------------------
x.supcs <- supc1(x, r =2.25, t = "dynamic")
table(x.supcs$cluster)


## ----fig.width=6, fig.height=6-------------------------------------------
plot(x, col=adjustcolor(x.supcs$cluster, alpha.f=0.2), 
        main=paste("r=",x.supcs$r, sep=""))
text(x=x.supcs$centers[1:31,], labels=1:31, cex=1.2)
text(x=x.supcs$centers[32:34,], labels=32:34, col=2)


## ------------------------------------------------------------------------
data(golub)
x=golub
x.freq <- freq.poly(x, breaks = 100)


## ------------------------------------------------------------------------
x.supcs <- supc1(golub, t="dynamic")
max(x.supcs[[1]]$cluster)
table(x.supcs[[1]]$size)


## ------------------------------------------------------------------------
qt=seq(-3, 3, by=0.05)
bluered=colorRampPalette(c("blue","white","red"))(length(qt)-1)


## ------------------------------------------------------------------------
library(fields)


## ----fig.width=8, fig.height=8-------------------------------------------
par(mfrow=c(3,1), oma=c(1,0,3,0))
for (i in 1:3){
  plot(x.supcs[[i]], type="heatmap", breaks=qt, col=bluered, major.size=50,
       xlab="Genes", ylab="Samples")
  image.plot(x, breaks=qt, col=bluered, 
             legend.only=TRUE, horizontal=TRUE, legend.mar=0, smallplot=c(0.7, 0.95, 0.16, 0.20))

}


