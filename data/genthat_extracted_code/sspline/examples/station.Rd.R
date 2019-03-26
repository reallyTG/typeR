library(sspline)


### Name: station
### Title: Distribution of the Stations on the World
### Aliases: station
### Keywords: hplot

### ** Examples

subdat <- WTdiff[sample(nrow(WTdiff), 200), 2:3]
attach(subdat)

station(lon, lat)

detach(subdat)



