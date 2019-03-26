library(gdalUtils)


### Name: gdaltransform
### Title: gdaltransform
### Aliases: gdaltransform

### ** Examples

# We'll pre-check to make sure there is a valid GDAL install.
# Note this isn't strictly neccessary, as executing the function will
# force a search for a valid GDAL install.
gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(valid_install)
{
pts <- matrix(c(177502,311865,177503,311866),ncol=2,byrow=TRUE)
gdaltransform(s_srs="EPSG:28992",t_srs="EPSG:31370",coords=pts,verbose=TRUE)
}



