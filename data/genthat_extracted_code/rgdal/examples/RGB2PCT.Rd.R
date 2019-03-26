library(rgdal)


### Name: RGB2PCT
### Title: Convert RGB three band to single band colour table
### Aliases: RGB2PCT
### Keywords: spatial

### ** Examples

## Not run: 
##D logo <- system.file("pictures/Rlogo.jpg", package="rgdal")[1]
##D x <- GDAL.open(logo)
##D dim(x)
##D dx <- RGB2PCT(x, band=1:3)
##D displayDataset(dx, reset.par=FALSE)
##D dim(dx)
##D GDAL.close(x)
##D GDAL.close(dx)
## End(Not run)



