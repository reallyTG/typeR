library(spacetime)


### Name: air
### Title: Air quality data, rural background PM10 in Germany, daily
###   averages 1998-2009
### Aliases: air DE_NUTS1 DE rural dates stations
### Keywords: datasets

### ** Examples

data(air)
rural = STFDF(stations, dates, data.frame(PM10 = as.vector(air)))
# how DE was created from DE_NUTS1:
if (require(rgeos))
	DE = gUnionCascaded(DE_NUTS1)



