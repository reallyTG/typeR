library(LSRS)


### Name: Normalized Difference Vegetation Index
### Title: Normalized Difference Vegetation Index
### Aliases: NDVI

### ** Examples

## The function is currently defined as
function (a, b){
    name <- NDVI(a,b)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,
     main="NDVI",
     xlab="easting", ylab="northing")
hist(cropXY,
     main="NDVI",

     xlab="NDVI",col="red", ylab="Frequency of Pixels")
}



