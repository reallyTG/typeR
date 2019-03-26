library(HelpersMG)


### Name: ScalePreviousPlot
### Title: Return the scale of the previous plot
### Aliases: ScalePreviousPlot

### ** Examples

## Not run: 
##D par(xaxs="i", yaxs="i")
##D plot(x=1:100, y=sin(1:100), type="l", bty="n", xlim=c(1,200), xlab="x", ylab="y")
##D xlim= ScalePreviousPlot()$xlim[1:2]
##D ylim= ScalePreviousPlot()$ylim[1:2]
##D par(xaxs="r", yaxs="i")
##D plot(x=1:100, y=sin(1:100), type="l", bty="n", xlim=c(1,200), xlab="x", ylab="y")
##D xlim= ScalePreviousPlot()$xlim[1:2]
##D ylim= ScalePreviousPlot()$ylim[1:2]
##D # Here is an example of the use of the label output
##D plot(x=1:100, y=sin(1:100), type="l", bty="n", xlim=c(1,200), xlab="", ylab="")
##D text(x=ScalePreviousPlot()$xlim["label"], y=ScalePreviousPlot()$ylim["center"], 
##D   xpd=TRUE, "Legend for Y axes", pos=3, srt=90)
##D text(x=ScalePreviousPlot()$xlim["center"], y=ScalePreviousPlot()$ylim["label"], 
##D   xpd=TRUE, "Legend for X axes", pos=1)
## End(Not run)



