library(LSRS)


### Name: Normalized Burn Ratio 2
### Title: Normalized Burn Ratio 2
### Aliases: NBR2

### ** Examples

## The function is currently defined as
function (a = SWIR1, b = SWIR2)
{
name=NBR2(a,b)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,
     main="NBR2",
     xlab="easting", ylab="northing")
hist(cropXY,
     main="NBR2"  ,
     xlab="NBR2",col="red", ylab="Frequency of Pixels")
     }



