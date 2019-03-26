library(smatr)


### Name: plotutils
### Title: Utility plotting functions
### Aliases: plotutils defineAxis nicePlot
### Keywords: misc

### ** Examples

# Load leaf lifetime dataset:
data(leaflife)

#First example of axis spacing
ft <- sma(longev~lma*rain,log="xy",data=leaflife)
xax <- defineAxis(major.ticks=c(50, 100, 200, 400))
yax <- defineAxis(major.ticks=c(0.25, 0.5, 1,2,4,8))
plot(ft, xaxis=xax, yaxis=yax)

#As above, marking axes on both sides
xax <- defineAxis(major.ticks=c(50, 100, 200, 400), both.sides=TRUE)
yax <- defineAxis(major.ticks=c(0.25, 0.5, 1,2,4,8), both.sides=TRUE)
plot(ft, xaxis=xax, yaxis=yax)

#Using labels with log10 spacing and minor tick marks
xax <- defineAxis(limits=c(10, 1E3), major.ticks=seqLog(1, 1000), 
	minor.ticks=makeLogMinor(seqLog(1, 1000)))
yax <- defineAxis(limits=c(1E-1, 1E1), major.ticks=seqLog(1E-2, 10), 
	minor.ticks=makeLogMinor(seqLog(1E-2, 10)))
plot(ft, xaxis=xax, yaxis=yax)

#As above, but using expressions as labels
xax <- defineAxis(limits=c(10, 1E3), major.ticks=seqLog(10, 1000), 
	minor.ticks=makeLogMinor(seqLog(10, 1000)), 
major.tick.labels = parse(text=paste("10^", c( 1,2,3), sep="")), 
	both.sides=FALSE)
yax <- defineAxis(limits=c(1E-1, 1E1), major.ticks=seqLog(1E-1, 10), 
	minor.ticks=makeLogMinor(seqLog(1E-1, 10)), 
major.tick.labels = parse(text=paste("10^", c( -1,0,1), sep="")), 
	both.sides=FALSE)
plot(ft, xaxis=xax, yaxis=yax)

#start an empty plot using nicePlot 
xax <- defineAxis(limits=c(8, 1.2E3), major.ticks=seqLog(1, 1000))
yax <- defineAxis(limits=c(0.8E-1, 1.2E1), major.ticks=seqLog(1E-2, 10))
nicePlot(xax,yax,log='xy')




