library(riverdist)


### Name: pointshp2segvert
### Title: Convert a Point Shapefile to River Locations
### Aliases: pointshp2segvert

### ** Examples

filepath <- system.file("extdata", package="riverdist")

fakefish_UTM5 <- pointshp2segvert(path=filepath, layer="fakefish_UTM5", rivers=Gulk)
head(fakefish_UTM5)

plot(x=Gulk)
points(fakefish_UTM5$x, fakefish_UTM5$y)
riverpoints(seg=fakefish_UTM5$seg, vert=fakefish_UTM5$vert, rivers=Gulk, pch=16, col=2)




