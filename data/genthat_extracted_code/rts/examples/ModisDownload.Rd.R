library(rts)


### Name: ModisDownload
### Title: Download, reproject, and mosaic Modis satellite images
### Aliases: ModisDownload getMODIS mosaicHDF reprojectHDF modisProducts
###   setNASAauth setMRTpath getNativePixelSize getNativeTemporalResolution
###   ModisDownload,character-method ModisDownload,numeric-method
###   mosaicHDF,character-method mosaicHDF,numeric-method
###   reprojectHDF,character-method reprojectHDF,numeric-method
###   getMODIS,character-method getMODIS,numeric-method
###   setNASAauth,ANY-method setMRTpath,ANY-method
### Keywords: utilities

### ** Examples

## Not run: 
##D library(raster)
##D 
##D library(RCurl)
##D 
##D # First, you need to register on https://urs.earthdata.nasa.gov/ and get a username and password
##D # for the first time, set the authentication info:
##D 
##D setNASAauth(username='myusername',password='mypass') 
##D 
##D # product list:
##D 
##D 
##D modisProducts(version=5)
##D modisProducts(version=6)
##D modisProducts(version=NULL) # both versions
##D 
##D #x=3 # or x="MOD14A1"
##D 
##D # download 4 tiles (h14v04, h14v05, h15v04, h15v05) in single date (2011.05.01)
##D 
##D # Following command only downloads the source HDF images, no mosaic and no projection
##D 
##D ModisDownload(x=x,h=c(17,18),v=c(4,5),dates='2011.05.01',mosaic=F,proj=F)
##D 
##D  
##D # alternatively, you can use modisHDF to download only HDF images:
##D 
##D modisHDF(x=x,h=c(17,18),v=c(4,5),dates='2011.05.01')
##D 
##D # same as the above command, but downloads all available images in 2011:
##D 
##D ModisDownload(x=x,h=c(17,18),v=c(4,5),dates=c('2011.01.01','2011.12.31'))
##D 
##D #------
##D 
##D # Downloads selected tiles, and mosaic them, but no projections:
##D 
##D ModisDownload(x=x,h=c(17,18),v=c(4,5),dates=c('2011.05.01','2011.05.31'),
##D               MRTpath='d:/MRT/bin',mosaic=T,proj=F)
##D 
##D #--- alternatively, you can first download the HDF images using getMODIS, 
##D #and then mosaic them using mosaicHDF!
##D 
##D # Downloads selected tiles, and mosaic, reproject them in UTM_WGS84, zone 30 projection and 
##D #convert all bands into Geotif format (the original HDF will be deleted!):
##D 
##D ModisDownload(x=x,h=c(17,18),v=c(4,5),dates=c('2011.05.01','2011.05.31'),MRTpath='d:/MRT/bin',
##D               mosaic=T,proj=T,proj_type="UTM",utm_zone=30,datum="WGS84",pixel_size=1000)
##D 
##D # Same as above command, but only second band out of 6 bands will be kept. (You do not need 
##D #to specify proj_params when "UTM" is selected as proj_type and the zone also is specified,
##D #but for other types of projections you do).
##D 
##D ModisDownload(x=x,h=c(17,18),v=c(4,5),dates=c('2011.05.01','2011.05.31'),MRTpath='d:/MRT/bin',
##D               mosaic=T,proj=T, bands_subset="0 1 0 0 0 0", proj_type="UTM",
##D               proj_params="-3 0 0 0 0 0 0 0 0 0 0 0 0 0 0",utm_zone=30,
##D               datum="WGS84",pixel_size=1000)
##D 
##D  
##D # Same as above command, but it spatially subsets the images into the specified box (UL and LR):
##D 
##D ModisDownload(x=x,h=c(17,18),v=c(4,5),dates=c('2011.05.01','2011.05.31'),MRTpath='d:/MRT/bin',
##D              mosaic=T,proj=T,UL=c(-42841.0,4871530.0),LR=c(1026104,3983860), 
##D              bands_subset="0 1 0 0 0 0", proj_type="UTM",
##D              proj_params="-3 0 0 0 0 0 0 0 0 0 0 0 0 0 0",utm_zone=30,datum="WGS84",
##D              pixel_size=1000)
##D 
##D 
## End(Not run)




