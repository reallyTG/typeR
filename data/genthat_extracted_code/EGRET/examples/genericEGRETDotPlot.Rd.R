library(EGRET)


### Name: genericEGRETDotPlot
### Title: Generic EGRET plotting function
### Aliases: genericEGRETDotPlot
### Keywords: graphics statistics water-quality

### ** Examples

eList <- Choptank_eList
Daily <- getDaily(eList)
x <- Daily$Date
y <- Daily$Q
xlim <- c(min(x),max(x))
ylim <- c(min(y),1.05*max(y))
xlab <- "Date"
ylab <- "Flow"
genericEGRETDotPlot(x=x, y=y, 
                    xlim=xlim, ylim=ylim,
                    xlab=xlab, ylab=ylab,
                    plotTitle="Test"
)



