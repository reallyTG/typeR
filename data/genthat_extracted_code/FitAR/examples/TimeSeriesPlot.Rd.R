library(FitAR)


### Name: TimeSeriesPlot
### Title: Multi-Panel or Single-Panel Time Series Plot with Aspect-Ratio
###   Control
### Aliases: TimeSeriesPlot
### Keywords: ts

### ** Examples

#from built-in datasets
 TimeSeriesPlot(AirPassengers)
 title(main="Monthly number of trans-Atlantic airline passengers")
#
#compare plots for lynx series
plot(lynx)
TimeSeriesPlot(lynx, type="o", pch=16, ylab="# pelts", main="Lynx Trappings")
#
#lattice style plot
data(Ninemile)
TimeSeriesPlot(Ninemile, SubLength=200)



