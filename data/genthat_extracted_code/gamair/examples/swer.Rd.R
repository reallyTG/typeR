library(gamair)


### Name: swer
### Title: Swiss 12 hour extreme rainfall
### Aliases: swer
### Keywords: data

### ** Examples

require(gamair);require(mgcv)
data(swer)
## GEV model, over-simplified for speed...
system.time(b <- gam(list(exra~s(elevation)+ climate.region,
         ~s(elevation),~1),family=gevlss,data=swer))
plot(b,pages=1,scale=0,scheme=1)



