library(uavRst)


### Name: otbtex_hara
### Title: OTB wrapper for Haralick's simple, advanced and higher order
###   texture features.
### Aliases: otbtex_hara

### ** Examples

## Not run: 
##D require(uavRst)
##D require(link2GI)
##D ## -check if OTB is installed correctly
##D giLinks <- uavRst::linkAll()
##D if (giLinks$otb$exist) {
##D setwd(tempdir())
##D ##- get some typical data as provided by the authority
##D tmp<-Sys.setlocale('LC_ALL','C')
##D utils::download.file(url="http://www.ldbv.bayern.de/file/zip/5619/DOP%2040_CIR.zip",
##D                      destfile="testdata.zip")
##D unzip("testdata.zip",junkpaths = TRUE,overwrite = TRUE)
##D 
##D # calculate simple Haralick-textures
##D r<- otbtex_hara(x="4490600_5321400.tif",texture = "simple",return_raster = TRUE)
##D 
##D #plot the results :
##D ##- visualize all layers
##D raster::plot(r)
##D tmp<-Sys.setlocale(category = "LC_ALL", locale = "de_DE.-8")
##D }
## End(Not run)



