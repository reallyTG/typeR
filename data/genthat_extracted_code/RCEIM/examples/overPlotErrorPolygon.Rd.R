library(RCEIM)


### Name: overPlotErrorPolygon
### Title: Overplot an error polygon
### Aliases: overPlotErrorPolygon
### Keywords: aplot

### ** Examples

# Shows a simple random curve and overplots a randomly created error bar.
dev.new()
xx <- 1:10
yy <- (1:10)/5 + 4 + (runif(10)-0.5)/0.5*2
plot(xx, yy, type="l", xlab="x", ylab="y", ylim=c(0,10))
err_yy <- 1.5 + (runif(10)-0.5)/0.5
overPlotErrorPolygon(xx,yy,err_yy, col=rgb(0,0,1,0.3), border=NA)



