library(modiscloud)


### Name: check_for_matching_geolocation_files
### Title: Checks that every MODIS cloud project HDF has a matching MOD03
###   file
### Aliases: check_for_matching_geolocation_files

### ** Examples

# Check your working directory
moddir = getwd()

# Here are some example MODIS files in modiscloud/extdata/
# Code excluded from CRAN check because it depends on modiscdata
## Not run: 
##D library(devtools)
##D # The modiscdata (MODIS c=cloud data=data) package is too big for CRAN (60 MB); so it is available on github:
##D # https://github.com/nmatzke/modiscdata
##D # If we can't get install_github() to work, try install_url():
##D # install_github(repo="modiscdata", username="nnmatzke")
##D install_url(url="https://github.com/nmatzke/modiscdata/archive/master.zip")
##D library(modiscdata)
##D moddir = system.file("extdata/2002raw/", package="modiscdata")
##D 
##D # You need to have some e.g. MOD files in it (from the MODIS-TERRA platform)
##D # (*won't* work with the default files stored in modiscloud/extdata/2002raw/)
##D list.files(path=moddir, pattern="MOD")
##D 
##D # This directory actually has MYD files (from the MODIS-AQUA platform)
##D # (*will* work with the default files stored in modiscloud/extdata/2002raw/)
##D list.files(path=moddir, pattern="MYD")
##D 
##D # Check for matches (for MODIS-TERRA platform)
##D # (*won't* work with the default files stored in modiscloud/extdata/2002raw/)
##D check_for_matching_geolocation_files(moddir=moddir, modtxt="MOD35_L2", geoloctxt="MOD03", return_geoloc=FALSE, return_product=FALSE)
##D 
##D # Check for matches (for MODIS-AQUA platform)
##D # (*will* work with the default files stored in modiscloud/extdata/2002raw/)
##D check_for_matching_geolocation_files(moddir=moddir, modtxt="MYD35_L2", geoloctxt="MYD03", return_geoloc=FALSE, return_product=FALSE)
## End(Not run)



