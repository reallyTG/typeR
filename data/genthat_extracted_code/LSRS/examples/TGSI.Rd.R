library(LSRS)


### Name: Topsoil Grain Size Index 
### Title: Topsoil Grain Size Index
### Aliases: TGSI

### ** Examples

## The function is currently defined as
function (a = "Red", b = "Blue", c = "green")
{
    name <- TGSI(a,b,c)
areaXY <-c(xmin, xmax, ymin, ymax)
cropXY <- crop(name, areaXY)
plot(cropXY,lwd=4,main="TGSI",
     xlab="easting", ylab="northing")
hist(cropXY,main="TGSI"
     ,
     xlab="TGSI",col="red", ylab="Frequency of Pixels")
  }



