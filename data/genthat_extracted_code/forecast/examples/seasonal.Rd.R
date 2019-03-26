library(forecast)


### Name: seasonal
### Title: Extract components from a time series decomposition
### Aliases: seasonal trendcycle remainder
### Keywords: ts

### ** Examples

plot(USAccDeaths)
fit <- stl(USAccDeaths, s.window="periodic")
lines(trendcycle(fit),col="red")

library(ggplot2)
autoplot(cbind(
	    Data=USAccDeaths,
	    Seasonal=seasonal(fit),
  	  Trend=trendcycle(fit),
	    Remainder=remainder(fit)),
    facets=TRUE) +
  ylab("") + xlab("Year")




