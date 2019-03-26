library(splusTimeSeries)


### Name: seriesMerge
### Title: Merging for Time Series and Signals
### Aliases: seriesMerge
### Keywords: ts

### ** Examples

a <- signalSeries(pos=1:10, data=data.frame(a = 11:20, b = 5 * (1:10))) 
b <- signalSeries(pos=5:14, data=data.frame(a = 11:20, b = 5 * (1:10))) 
seriesMerge(a, b) 
a <- timeSeries(pos=as(1:10, "timeDate"), 
		data=data.frame(a = 11:20, b = 5 * (1:10))) 
b <- timeSeries(pos=as(5:14, "timeDate"), 
	        data=data.frame(a = 11:20, b = 5 * (1:10))) 
seriesMerge(a, b, pos="union") 



