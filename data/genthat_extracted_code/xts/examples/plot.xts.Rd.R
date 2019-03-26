library(xts)


### Name: plot.xts
### Title: Plotting xts Objects
### Aliases: plot.xts lines.xts points.xts

### ** Examples

## Not run: 
##D data(sample_matrix)
##D sample.xts <- as.xts(sample_matrix)
##D 
##D # plot the Close
##D plot(sample.xts[,"Close"])
##D 
##D # plot a subset of the data
##D plot(sample.xts[,"Close"], subset="2007-04-01/2007-06-31")
##D 
##D # function to compute simple returns
##D simple.ret <- function(x, col.name){
##D   x[,col.name] / lag(x[,col.name]) - 1
##D }
##D 
##D # plot the close and add a panel with the simple returns
##D plot(sample.xts[,"Close"])
##D R <- simple.ret(sample.xts, "Close")
##D lines(R, type="h", on=NA)
##D 
##D # add the 50 period simple moving average to panel 1 of the plot
##D library(TTR)
##D lines(SMA(sample.xts[,"Close"], n = 50), on=1, col="blue")
##D 
##D # add month end points to the chart
##D points(sample.xts[endpoints(sample.xts[,"Close"], on = "months"), "Close"], 
##D        col="red", pch=17, on=1)
##D 
##D # add legend to panel 1
##D addLegend("topright", on=1, 
##D           legend.names = c("Close", "SMA(50)"), 
##D           lty=c(1, 1), lwd=c(2, 1),
##D           col=c("black", "blue", "red"))
## End(Not run)



