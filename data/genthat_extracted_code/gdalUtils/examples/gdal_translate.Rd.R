library(gdalUtils)


### Name: gdal_translate
### Title: gdal_translate
### Aliases: gdal_translate

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install
# and that raster and rgdal are also installed.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(require(raster) && require(rgdal) && valid_install)
{
# Example from the original gdal_translate documentation:
src_dataset <- system.file("external/tahoe_highrez.tif", package="gdalUtils")
# Original gdal_translate call:
# gdal_translate -of GTiff -co "TILED=YES" tahoe_highrez.tif tahoe_highrez_tiled.tif
gdal_translate(src_dataset,"tahoe_highrez_tiled.tif",of="GTiff",co="TILED=YES",verbose=TRUE)
# Pull out a chunk and return as a raster:
gdal_translate(src_dataset,"tahoe_highrez_tiled.tif",of="GTiff",
srcwin=c(1,1,100,100),output_Raster=TRUE,verbose=TRUE)
# Notice this is the equivalent, but follows gdal_translate's parameter format:
gdal_translate(src_dataset,"tahoe_highrez_tiled.tif",of="GTiff",
srcwin="1 1 100 100",output_Raster=TRUE,verbose=TRUE)
}
## Not run: 
##D  
##D # Extract the first subdataset from an HDF4 file:
##D hdf4_dataset <- system.file("external/test_modis.hdf", package="gdalUtils")
##D gdal_translate(hdf4_dataset,"test_modis_sd1.tif",sd_index=1)
## End(Not run)



