library(geomapdata)


### Name: ETOPO5
### Title: Etopo5 topographic data
### Aliases: ETOPO5
### Keywords: datasets

### ** Examples


## Not run: 
##D library(GEOmap)
##D data(ETOPO5)
##D 
##D data(fujitopo)
##D data(japmap)
##D PLOC=list(LON=c(137.008, 141.000),LAT=c(34.000, 36.992),
##D             x=c(137.008, 141.000), y=c(34.000, 36.992) )
##D 
##D 
##D 
##D JAPANtopo = subsetTOPO(ETOPO5, PLOC)
##D 
##D d1 = dim(JAPANtopo$z)
##D 
##D JAPANtopo$z = JAPANtopo$z[  , d1[2]:1 ]
##D 
##D image(JAPANtopo, col=terrain.colors(100), asp=1 )
##D plotGEOmap(japmap, add=TRUE)
##D 
##D 
## End(Not run)





