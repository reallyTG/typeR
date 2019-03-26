library(thief)


### Name: plot.tsaggregates
### Title: Plot time series aggregates
### Aliases: plot.tsaggregates autoplot.tsaggregates

### ** Examples

deathagg <- tsaggregates(USAccDeaths)
plot(deathagg, series=c(1,2,4,6))

library(ggplot2)
autoplot(deathagg)




