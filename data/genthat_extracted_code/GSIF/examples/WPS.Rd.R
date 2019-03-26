library(GSIF)


### Name: WPS-class
### Title: A class for a Web Processing Service
### Aliases: WPS-class over,WPS,SpatialPoints-method describe,WPS-method
###   getProcess,WPS-method getProcess describe show,WPS-method
###   subset,WPS-method
### Keywords: classes

### ** Examples

## Not run: 
##D library(XML)
##D library(sp)
##D URI = "http://wps.worldgrids.org/pywps.cgi"
##D server <- list(URI=URI, request="execute", 
##D     version="version=1.0.0", service.name="service=wps", 
##D     identifier="identifier=sampler_local1pt_nogml")
##D glcesa3.wps <- new("WPS", server=server, inRastername="glcesa3a")
##D # show(biocl15.wps)
##D prl <- getProcess(glcesa3.wps)
##D prl[7]
##D describe(glcesa3.wps, identifier="overlay")
##D p1 <- data.frame(lon=15, lat=15)
##D coordinates(p1) <- ~lon+lat
##D proj4string(p1) <- CRS("+proj=longlat +datum=WGS84")
##D p1
##D over(glcesa3.wps, p1)
##D # fetch grids and load the to R:
##D glcesa3 <- subset(glcesa3.wps, bbox=matrix(c(20,40,22,42), nrow=2))
##D image(glcesa3)
## End(Not run)



