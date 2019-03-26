library(oce)


### Name: plot,ctd-method
### Title: Plot CTD Data
### Aliases: plot,ctd-method plot.ctd

### ** Examples

## 1. simple plot
library(oce)
data(ctd)
plot(ctd)

## 2. how to customize depth contours
par(mfrow=c(1,2))
data(section)
stn <- section[["station", 105]]
plot(stn, which='map', drawIsobaths=TRUE)
plot(stn, which='map')
data(topoWorld)
tlon <- topoWorld[["longitude"]]
tlat <- topoWorld[["latitude"]]
tdep <- -topoWorld[["z"]]
contour(tlon, tlat, tdep, drawlabels=FALSE,
        levels=seq(1000,6000,1000), col='lightblue', add=TRUE)
contour(tlon, tlat, tdep, vfont=c("sans serif", "bold"),
        levels=stn[['waterDepth']], col='red', lwd=2, add=TRUE)




