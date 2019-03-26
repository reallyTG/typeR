library(maptools)


### Name: gpcholes
### Title: Hisaji Ono's lake/hole problem
### Aliases: gpcholes h1pl h2pl
### Keywords: datasets

### ** Examples

data(gpcholes)
opar <- par(mfrow=c(1,2))
plot(SpatialPolygons(list(h2pl)), col="red", pbg="white", border="blue")
plot(SpatialPolygons(list(h1pl)), col="red", pbg="white", border="blue")
par(opar)



