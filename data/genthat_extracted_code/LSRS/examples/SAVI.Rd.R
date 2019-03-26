library(LSRS)


### Name: Soil-Adjusted Vegetation Index
### Title: Soil-Adjusted Vegetation Index
### Aliases: SAVI

### ** Examples

## The function is currently defined as
function (a="NIR",b="Red")
{
name <- SAVI(a,b)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,
     main="SAVI",
     xlab="easting", ylab="northing")
hist(cropXY,
     main="SAVI"
     ,
     xlab="SAVI",col="red", ylab="Frequency of Pixels")
  }



