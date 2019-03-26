library(rcarbon)


### Name: spweights
### Title: Compute weights from distance matrix
### Aliases: spweights

### ** Examples

lon <- c(11.3426,0.1278,0.1218)
lat <- c(44.4949,51.5074,52.2053)
library(sp)
d <- spDists(x=cbind(lon,lat),y=cbind(lon,lat))
spweights(d,h=100)
spweights(d,h=100,kernel="fixed")



