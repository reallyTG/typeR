library(splusTimeSeries)


### Name: align
### Title: Time Series and Signal Interpolation and Alignment
### Aliases: align
### Keywords: ts

### ** Examples

a <- signalSeries(pos=1:10, data=data.frame(a = 11:20, b = 5 * (1:10))) 
align(a, c(.2, 3, 7.8, 12), how = "interp", error.how = "nearest") 
a <- timeSeries(pos=as(1:10, "timeDate"), 
		data=data.frame(a = 11:20, b = 5 * (1:10))) 
alpos <- as(c(.2, 3, 7.8, 12), "timeDate") 
alpos@time.zone <- "JST" 
positions(a)@time.zone <- "PST" 
align(a, alpos, matchtol = 1, localzone = TRUE) 
align(a, matchtol=1, localzone=TRUE, by="days", k.by=2) 



