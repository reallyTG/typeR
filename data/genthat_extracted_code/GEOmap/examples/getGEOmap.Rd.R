library(GEOmap)


### Name: getGEOmap
### Title: Get Geomap
### Aliases: getGEOmap
### Keywords: misc

### ** Examples


## Not run: 
##D library(geomapdata)
##D 
##D  data(cosomap)
##D      data(faults)
##D      data(hiways)
##D      data(owens)
##D 
##D cosogeol = getGEOmap("/home/lees/XMdemo/GEOTHERM/cosogeol")
##D 
##D cosogeol = boundGEOmap(cosogeol)
##D 
##D 
##D  proj = cosomap$PROJ
##D     
##D plotGEOmapXY(cosomap, PROJ=proj,  add=FALSE, ann=FALSE, axes=FALSE)
##D   
##D  plotGEOmapXY(cosogeol, PROJ=proj,  add=TRUE, ann=FALSE, axes=FALSE)
##D   
##D 
##D   plotGEOmapXY(cosomap, PROJ=proj,  add=TRUE, ann=FALSE, axes=FALSE)
##D   
##D   plotGEOmapXY(faults, PROJ=proj,  add=TRUE, ann=FALSE, axes=FALSE)
##D   
## End(Not run)




