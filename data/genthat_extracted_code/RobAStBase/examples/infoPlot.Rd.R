library(RobAStBase)


### Name: infoPlot
### Title: Plot absolute and relative information
### Aliases: infoPlot infoPlot-methods infoPlot,IC-method
### Keywords: robust

### ** Examples

N <- NormLocationScaleFamily(mean=0, sd=1) 
IC1 <- optIC(model = N, risk = asCov())
infoPlot(IC1)

## don't run to reduce check time on CRAN
## No test: 
## selection of subpanels for plotting
par(mfrow=c(1,2))
infoPlot(IC1, mfColRow = FALSE, to.draw.arg=c("Abs","sd"))
infoPlot(IC1, mfColRow = FALSE, to.draw.arg=c("Abs","sd"), log="y")

infoPlot(IC1, mfColRow = FALSE, to.draw.arg=c("Abs","mean"), 
              panel.first= grid(), ylim = c(0,4), xlim = c(-6,6))
infoPlot(IC1, mfColRow = FALSE, to.draw.arg=c("Abs","mean"), 
              panel.first= grid(), ylim = c(0,4,-3,3), xlim = c(-6,6))

par(mfrow=c(1,3))
infoPlot(IC1, mfColRow = FALSE, panel.first= grid(),
         ylim = c(0,4,0,.3,0,.8), xlim=c(-6,6))
par(mfrow=c(1,1))

data <- r(N)(20)
par(mfrow=c(1,3))
infoPlot(IC1, data=data, mfColRow = FALSE, panel.first= grid(),
         with.lab = TRUE, cex.pts=2,
         which.lbs = c(1:4,15:20), which.Order = 1:6,
         return.Order = TRUE)
infoPlot(IC1, data=data[1:10], mfColRow = FALSE, panel.first= grid(),
         with.lab = TRUE, cex.pts=0.7)
par(mfrow=c(1,1))

ICr <- makeIC(list(function(x)sign(x),function(x)sign(abs(x)-qnorm(.75))),N)
data <- r(N)(600)
data.c <- c(data, 1000*data[1:30])
par(mfrow=c(3,1))
infoPlot(ICr, data=data.c, tmar=c(4.1,0,0), bmar=c(0,0,4.1),
         xaxt=c("n","n","s"), mfColRow = FALSE, panel.first= grid(),
         cex.pts=c(.9,.9), alpha.trsp=20, lwd=2, lwdI=1.5, col=3,
         col.pts=c(3,2), colI=2, pch.pts=c(20,20), inner=FALSE,
         scaleX = TRUE, scaleX.fct=pnorm, scaleX.inv=qnorm,
         scaleY=TRUE, scaleY.fct=function(x) pchisq(x,df=1),
         scaleY.inv=function(x)qchisq(x,df=1),legend.cex = 1.0)

## End(No test)




