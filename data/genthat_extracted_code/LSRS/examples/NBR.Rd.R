library(LSRS)


### Name: Normalized Burn Ratio 
### Title: Normalized Burn Ratio
### Aliases: NBR

### ** Examples

## The function is currently defined as
function (a = "NIR", b = "SWIR")
{
    name=NBR(a,b)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,
     main="NBR",
     xlab="easting", ylab="northing")
hist(cropXY,
     main="Histogram of NBR"
     ,
     xlab="NBR",col="red", ylab="Frequency of Pixels")
     }



