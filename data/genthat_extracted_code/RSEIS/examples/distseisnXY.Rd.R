library(RSEIS)


### Name: distseisnXY
### Title: Distances from an RSEIS list
### Aliases: distseisnXY
### Keywords: misc

### ** Examples


data(GH)
###   assume the lat lon in GH are x, y (projected)

staxy <-  list(nam=GH$stafile$name, x=GH$stafile$lon,
               y=GH$stafile$lat, z=GH$stafile$z)
 LOC <- list(x=GH$pickfile$LOC$lon, y=GH$pickfile$LOC$lat,
             z=GH$pickfile$LOC$z)
distseisnXY(GH, sta =staxy, LOC = LOC)






