library(rgdal)


### Name: displayDataset
### Title: Display a GDAL dataset
### Aliases: displayDataset
### Keywords: spatial

### ** Examples

## Not run: 
##D logo <- system.file("pictures/Rlogo.jpg", package="rgdal")[1]
##D x <- GDAL.open(logo)
##D opar <- par(no.readonly=TRUE)
##D par(mfrow=c(2,2))
##D displayDataset(x, band=1, reset.par=FALSE)
##D displayDataset(x, band=2, reset.par=FALSE)
##D #displayDataset(x, band=3, reset.par=TRUE)
##D par(opar)
##D dx <- RGB2PCT(x, band=1:3)
##D displayDataset(dx, reset.par=FALSE)
##D GDAL.close(x)
##D GDAL.close(dx)
## End(Not run)



