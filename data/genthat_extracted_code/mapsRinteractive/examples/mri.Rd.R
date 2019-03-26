library(mapsRinteractive)


### Name: mri
### Title: mri
### Aliases: mri

### ** Examples

##retrieve example point location data
data('CLAYs')
##create path to example raster dataset
rst.path<-  system.file("extdata/CLAYr.tif", package="mapsRinteractive")
##run local adaptation and evaluation
mri.out<-mri(
 rst.file = rst.path,
 pts.df = CLAYs,
 pts.attr ='clay_percent',
 pts.x= 'POINT_X',
 pts.y= 'POINT_Y',
 epsg = 3006
 )
##check evaluation metasures
print(mri.out$evaluation)



