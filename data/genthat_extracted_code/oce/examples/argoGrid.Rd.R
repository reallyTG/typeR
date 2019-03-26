library(oce)


### Name: argoGrid
### Title: Grid Argo float data
### Aliases: argoGrid

### ** Examples

library(oce)
data(argo)
g <- argoGrid(argo, p=seq(0, 100, 1))
par(mfrow=c(2,1))
t <- g[["time"]]
z <- -g[["pressure"]][,1]
## Set zlim because of spurious temperatures.
imagep(t, z, t(g[['temperature']]), ylim=c(-100,0), zlim=c(0,20))
imagep(t, z, t(g[['salinity']]), ylim=c(-100,0))




