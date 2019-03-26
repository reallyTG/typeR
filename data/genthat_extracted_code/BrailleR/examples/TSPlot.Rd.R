library(BrailleR)


### Name: TSPlot
### Title: Create a standard time series plot with a few extra elements
###   added to the output object
### Aliases: TimeSeriesPlot plot.tsplot print.tsplot

### ** Examples

attach(airquality)
op = par(mfcol=c(3,2))
plot(as.ts(Wind), ylab="Wind", col=4)
test1 = TimeSeriesPlot(Wind, col=4)
test1 #does the plot method work?
plot(as.ts(Ozone), ylab="Ozone")
test2 = TimeSeriesPlot(Ozone)
test2 # does the plot method work?
par(op)
detach(airquality)
rm(test1); rm(test2); rm(op)



