library(LSRS)


### Name: Enhanced Vegetation Index
### Title: Enhanced Vegetation Index
### Aliases: EVI

### ** Examples

## The function is currently defined as
function (a = NIR, b = Red, c = Blue,Pixel.Depth)
{
name=EVI(a,b,c,Pixel.Depth=null)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,  main="EVI",xlab="easting", ylab="northing")
hist(cropXY,   main="EVI",
     xlab="EVI",col="red", ylab="Frequency of Pixels")
  }



