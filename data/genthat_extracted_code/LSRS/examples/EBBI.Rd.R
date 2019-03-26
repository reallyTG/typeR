library(LSRS)


### Name: Enhanced Built-Up and Bareness Index
### Title: Enhanced Built-Up and Bareness Index
### Aliases: EBBI

### ** Examples

## The function is currently defined as
function (x = "NIR", y = "SWIR", z = "TIR", Pixel.Depth)
{
name <- EBBI (a,b,c,Pixel.Depth=1)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,main=" EBBI ",
     xlab="easting", ylab="northing")
hist(cropXY,main="EBBI "
     ,
     xlab=" EBBI ",col="red", ylab="Frequency of Pixels")
  }



