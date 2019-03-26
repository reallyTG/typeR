library(maptools)


### Name: readAsciiGrid
### Title: read/write to/from (ESRI) asciigrid format
### Aliases: readAsciiGrid writeAsciiGrid
### Keywords: programming

### ** Examples

x <- readAsciiGrid(system.file("grids/test.ag", package="maptools")[1])
summary(x)
image(x)
xp <- as(x, "SpatialPixelsDataFrame")
abline(h=332000, lwd=3)
xpS <- xp[coordinates(xp)[,2] < 332000,]
summary(xpS)
xS <- as(xpS, "SpatialGridDataFrame")
summary(xS)
tmpfl <- paste(tempdir(), "testS.ag", sep="/")
writeAsciiGrid(xS, tmpfl)
axS <- readAsciiGrid(tmpfl)
opar <- par(mfrow=c(1,2))
image(xS, main="before export")
image(axS, main="after import")
par(opar)
unlink(tmpfl)



