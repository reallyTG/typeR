library(splusTimeSeries)


### Name: seriesLag
### Title: Time Series Lag/Lead Function
### Aliases: seriesLag seriesLag,series-method
### Keywords: ts

### ** Examples

x <- timeSeries(data=data.frame(x=1:10, y=11:20),
    from="7/4/2000", by="bizdays")
seriesLag(x, 1)
seriesLag(x, -1)



