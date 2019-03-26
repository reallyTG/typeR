library(sspline)


### Name: plot.smooth.sspline
### Title: Plot a Smooth.sspline Object
### Aliases: plot.smooth.sspline
### Keywords: smooth methods hplot

### ** Examples

subdat <- WTdiff[sample(nrow(WTdiff), 200), 2:4]
attach(subdat)

splobj <- smooth.sspline(lon, lat, avgd)

plot(splobj, lon=seq(-180, 180, len=50), lat=seq(-90, 90, len=25),
     main="World Average Temperature Change")

detach(subdat)



