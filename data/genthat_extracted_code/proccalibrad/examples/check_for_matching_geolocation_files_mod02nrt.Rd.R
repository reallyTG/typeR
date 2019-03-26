library(proccalibrad)


### Name: check_for_matching_geolocation_files_mod02nrt
### Title: Checks that every MODIS calibrated radiance project HDF has a
###   matching MOD03 file
### Aliases: check_for_matching_geolocation_files_mod02nrt

### ** Examples

# Check your working directory
moddir = getwd()

# Here are some example MODIS files in mod02nrt/extdata/
# Code excluded from CRAN check because it depends on modiscdata
## Not run: 
##D library(devtools)
##D library(modiscdata)
##D moddir = system.file("extdata/2002raw/", package="modiscdata")
##D 
##D # You need to have some e.g. MOD files in it (from the MODIS-TERRA platform)
##D list.files(path=moddir, pattern="MOD")
##D list.files(path=moddir, pattern="MOD")
##D 
##D # Check for matches (for MODIS-TERRA platform)
##D check_for_matching_geolocation_files_mod02nrt(moddir=moddir, modtxt="MOD02", geoloctxt="MOD03",
##D  return_geoloc=FALSE, return_product=FALSE)
## End(Not run)




