library(womblR)


### Name: PlotVfTimeSeries
### Title: PlotVfTimeSeries
### Aliases: PlotVfTimeSeries

### ** Examples

data(VFSeries)
PlotVfTimeSeries(Y = VFSeries$DLS,
                  Location = VFSeries$Location,
                  Time = VFSeries$Time,
                  main = "Visual field sensitivity time series \n at each location",
                  xlab = "Days from baseline visit",
                  ylab = "Differential light sensitivity (dB)")





