library(daymetr)


### Name: nc2tif
### Title: Converts .nc files in a given directory to .tif.
### Aliases: nc2tif
### Keywords: Daymet, climate conversion data, gridded netCDF,

### ** Examples


## Not run: 
##D 
##D  # The below command converts all netCDF data in
##D  # the provided path to geotiff files. Existing
##D  # files will be overwritten. If set to FALSE,
##D  # files will not be overwritten.
##D  
##D  # download the data
##D  download_daymet_ncss(param = "tmin",
##D                       frequency = "annual",
##D                       path = tempdir(),
##D                       silent = TRUE))
##D  
##D  # convert files from nc to tif
##D  nc2tif(path = tempdir(),
##D  overwrite = TRUE)
##D  
##D  # print converted files
##D  print(list.files(tempdir(), "*.tif"))
##D  
## End(Not run)



