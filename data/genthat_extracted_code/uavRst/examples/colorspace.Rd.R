library(uavRst)


### Name: colorspace
### Title: imagemagick based function to transform the RGB color space into
###   another
### Aliases: colorspace

### ** Examples

## Not run: 
##D 
##D ##- required packages
##D require(uavRst)
##D setwd(tempdir())
##D ##- set locale
##D tmp<-Sys.setlocale('LC_ALL','C')
##D ##- get some typical data as provided by the authority
##D utils::download.file(url="http://www.ldbv.bayern.de/file/zip/5619/DOP%2040_CIR.zip",
##D                      destfile="testdata.zip")
##D unzip("testdata.zip",junkpaths = TRUE,overwrite = TRUE)
##D ##- original color space
##D raster::plotRGB(raster::stack("4490600_5321400.tif"))
##D ##- change colorspace from RGB to HSI
##D r2 <- colorspace(input="4490600_5321400.tif",colorspace="HSI")
##D 
##D ##- visualize it
##D raster::plotRGB(r2)
##D 
##D ##- reset locale
##D tmp<-Sys.setlocale(category = "LC_ALL", locale = "de_DE.-8")
##D ##+
## End(Not run)



