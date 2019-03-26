library(LSRS)


### Name: Modified Soil-Adjusted Vegetation Index
### Title: Modified Soil-Adjusted Vegetation Index
### Aliases: MSAVI

### ** Examples

## The function is currently defined as
function (a = "NIR", b = "Red", Pixel.Depth)
{
name=MSAVI(a,b,Pixel.Depth=null)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4, main="MSAVI",
     xlab="easting", ylab="northing")
hist(cropXY,
     main="MSAVI",
     xlab="MSAVI",col="red", ylab="Frequency of Pixels")
  }



