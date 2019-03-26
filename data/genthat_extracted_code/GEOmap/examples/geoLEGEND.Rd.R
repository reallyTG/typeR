library(GEOmap)


### Name: geoLEGEND
### Title: Geological legend from GEOmap Structure
### Aliases: geoLEGEND
### Keywords: misc

### ** Examples


## Not run: 
##D 
##D library(RPMG)
##D library(RSEIS)
##D library(GEOmap)
##D library(geomapdata)
##D 
##D data(cosogeol)
##D data(cosomap)
##D      data(faults)
##D      data(hiways)
##D      data(owens)
##D 
##D proj = cosomap$PROJ
##D    
##D XMCOL = setXMCOL()
##D 
##D newcol = XMCOL[cosogeol$STROKES$col+1]
##D cosocolnums = cosogeol$STROKES$col
##D cosogeol$STROKES$col = newcol
##D ss = strsplit(cosogeol$STROKES$nam, split="_")     
##D 
##D geo = unlist(sapply(ss  , "[[", 1))
##D 
##D 
##D UGEO = unique(geo)
##D 
##D 
##D mgeo = match( geo, UGEO )
##D 
##D gcol = paste(sep=".", geo, cosogeol$STROKES$col)
##D 
##D 
##D ucol = unique(gcol)
##D 
##D N = length(ucol)
##D 
##D 
##D spucol = strsplit(ucol,split="\.")     
##D 
##D        
##D names = unlist(sapply(spucol  , "[[", 1))
##D 
##D shades = unlist(sapply(spucol  , "[[", 2))
##D 
##D ORDN = order(names)
##D ### example:
##D 
##D 
##D par(mai=c(0.5, 1.5, 0.5, 0.5) )
##D 
##D  plotGEOmapXY(cosomap, PROJ=proj,  add=FALSE, ann=FALSE, axes=FALSE)
##D   
##D 
##D      plotGEOmapXY(cosogeol, PROJ=proj,  add=TRUE, ann=FALSE, axes=FALSE)
##D   
##D geoLEGEND(names[ORDN], shades[ORDN], .28, .14, 4, 16, side=2)
##D 
##D ####
##D par(mai=c(0.5, 0.5, 1.0, 0.5) )
##D 
##D  plotGEOmapXY(cosomap, PROJ=proj,  add=FALSE, ann=FALSE, axes=FALSE)
##D   
##D 
##D      plotGEOmapXY(cosogeol, PROJ=proj,  add=TRUE, ann=FALSE, axes=FALSE)
##D   
##D geoLEGEND(names[ORDN], shades[ORDN], .28, .14, 16, 6, side=3)
##D 
##D 
##D ####
##D par(mai=c(0.5, 0.5, 0.5, 1) )
##D 
##D  plotGEOmapXY(cosomap, PROJ=proj,  add=FALSE, ann=FALSE, axes=FALSE)
##D   
##D 
##D      plotGEOmapXY(cosogeol, PROJ=proj,  add=TRUE, ann=FALSE, axes=FALSE)
##D   
##D geoLEGEND(names[ORDN], shades[ORDN], .28, .14, 3, 16, side=4)
##D 
##D 
##D ####
##D par(mai=c(1.5, 0.5, 0.5, 0.5) )
##D 
##D  plotGEOmapXY(cosomap, PROJ=proj,  add=FALSE, ann=FALSE, axes=FALSE)
##D   
##D 
##D      plotGEOmapXY(cosogeol, PROJ=proj,  add=TRUE, ann=FALSE, axes=FALSE)
##D   
##D geoLEGEND(names[ORDN], shades[ORDN], .28, .14, 16, 3, side=1)
##D 
##D 
## End(Not run)




