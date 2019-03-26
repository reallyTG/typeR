library(LSRS)


### Name: Normalized Difference Moisture (Water) Index 
### Title: Normalized Difference Moisture (Water) Index
### Aliases: NDMI

### ** Examples

## The function is currently defined as
function (a = "NIR", b = "SWIR")
{
   name <- NDMI(a,b)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,
     main="NDMI",
     xlab="easting", ylab="northing")
hist(cropXY,
     main="NDMI"
     ,
     xlab="NDMI",col="red", ylab="Frequency of Pixels")
  }



