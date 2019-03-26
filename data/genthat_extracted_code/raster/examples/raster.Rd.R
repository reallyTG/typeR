library(raster)


### Name: raster
### Title: Create a RasterLayer object
### Aliases: raster raster,missing-method raster,character-method
###   raster,Extent-method raster,BasicRaster-method
###   raster,RasterLayer-method raster,RasterLayerSparse-method
###   raster,RasterStack-method raster,RasterBrick-method
###   raster,Spatial-method raster,SpatialGrid-method
###   raster,SpatialPixels-method raster,matrix-method
###   raster,big.matrix-method raster,list-method raster,im-method
###   raster,asc-method raster,kasc-method raster,kde-method
###   raster,grf-method raster,sf-method raster,GridTopology-method
### Keywords: methods spatial

### ** Examples

# Create a RasterLayer object from a file
#   N.B.: For your own files, omit the 'system.file' and 'package="raster"' bits
#   these are just to get the path to files installed with the package

f <- system.file("external/test.grd", package="raster")
f
r <- raster(f)

logo <- raster(system.file("external/rlogo.grd", package="raster")) 


#from scratch
r1 <- raster(nrows=108, ncols=21, xmn=0, xmx=10)

#from an Extent object
e <- extent(r)
r2 <- raster(e)

#from another Raster* object
r3 <- raster(r)
s <- stack(r, r, r)
r4 <- raster(s)
r5 <- raster(s, 3)


## Not run: 
##D # from NSIDC sea ice concentration file
##D baseurl <- "ftp://sidads.colorado.edu/pub/DATASETS/"
##D # southern hemisphere
##D f1 <- paste(baseurl, 
##D  "nsidc0051_gsfc_nasateam_seaice/final-gsfc/south/daily/2013/nt_20130114_f17_v01_s.bin",
##D  sep='')
##D # or northern hemisphere
##D f2 <- paste(baseurl, 
##D  "nsidc0051_gsfc_nasateam_seaice/final-gsfc/north/daily/2013/nt_20130105_f17_v01_n.bin",
##D  sep='')
##D      
##D if (!file.exists(basename(f1))) download.file(f1, basename(f1), mode = "wb")
##D ice1 <- raster(basename(f1))
##D 
##D if (!file.exists(basename(f2))) download.file(f2, basename(f2), mode = "wb")
##D ice2 <- raster(basename(f2))
##D      
## End(Not run)



