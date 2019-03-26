library(splusTimeSeries)


### Name: shift
### Title: Create a Shifted Time Series
### Aliases: shift shift,ANY-method
### Keywords: ts

### ** Examples

x <- signalSeries(data=data.frame(a=1:10, b=letters[1:10]), positions=1:10)
x5 <- shift(x,5)
seriesMerge(x, x5, pos="union")



