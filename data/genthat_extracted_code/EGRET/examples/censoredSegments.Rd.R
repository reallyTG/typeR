library(EGRET)


### Name: censoredSegments
### Title: Generic plotting function to create censored line segments
### Aliases: censoredSegments

### ** Examples

x <- c(1,2,3,4,5,6)
y <- c(1,3,4,3.3,4.4,7)
xlim <- c(min(x)*.75,max(x)*1.25)
ylim <- c(0,1.25*max(y))
xlab <- "Date"
ylab <- "Concentration"
xTicks <- pretty(xlim)
yTicks <- pretty(ylim)
genericEGRETDotPlot(x=x, y=y, 
                    xlim=xlim, ylim=ylim,
                    xlab=xlab, ylab=ylab,
                    xTicks=xTicks, yTicks=yTicks,
                    plotTitle="Test"
)
yBottom <- 0
yLow <- c(NA,3,4,3.3,4,7)
yHigh <- c(1,3,4,3.3,5,NA)
Uncen <- c(0,1,1,1,0,0)
censoredSegments(yBottom=yBottom,yLow=yLow,yHigh=yHigh,x=x,Uncen=Uncen)



