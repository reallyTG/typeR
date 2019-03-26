library(LSRS)


### Name: cover management factor in RUSLE model
### Title: cover management factor in RUSLE model
### Aliases: C.factor

### ** Examples

## The function is currently defined as
function (a = "NIR", b = "Red", method, na.rm = TRUE)
{
    name <- C.factor (a,b, method="Knijff",na.rm = TRUE)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,main=" C.factor ",
     xlab="easting", ylab="northing")
hist(cropXY,main=" C.factor "
     ,
     xlab=" C.factor ",col="red", ylab="Frequency of Pixels")
  }



