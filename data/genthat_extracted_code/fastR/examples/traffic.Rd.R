library(fastR)


### Name: traffic
### Title: New England traffic fatalities (1951-1959)
### Aliases: traffic
### Keywords: datasets

### ** Examples


data(traffic)
xyplot(cn.deaths ~ year, data=traffic, type=c('l','g'))
trafficLong <- reshape(traffic,direction='long', idvar="year", 
				varying=list(3:6), v.names='deathRate',
				times=names(traffic)[3:6], timevar='state')
xyplot(deathRate~year, groups=state, data=trafficLong, type='b',
		auto.key=list(lines=TRUE, points=FALSE, columns=2))




