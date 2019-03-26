library(geiger)


### Name: dtt
### Title: disparity-through-time
### Aliases: dtt disparity
### Keywords: arith

### ** Examples


geo=get(data(geospiza))

## disparity -- not tree-based
disparity(data=geo$dat) # not tree-based

## cladewise disparities
disparity(phy=geo$phy, data=geo$dat)

## disparity through time of culmen length
dttcul<-dtt(phy=geo$phy, data=geo$dat[,"culmenL"], nsim=100, plot=TRUE)

## disparity through time of entire dataset -- without simulated data
dttgeo<-dtt(phy=geo$phy, data=geo$dat, nsim=0, plot=TRUE)




