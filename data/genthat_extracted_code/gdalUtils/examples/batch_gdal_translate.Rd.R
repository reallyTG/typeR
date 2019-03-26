library(gdalUtils)


### Name: batch_gdal_translate
### Title: batch_gdal_translate
### Aliases: batch_gdal_translate

### ** Examples

## Not run: 
##D  
##D input_folder <- system.file("external",package="gdalUtils")
##D list.files(input_folder,pattern=".tif")
##D output_folder <- tempdir()
##D # library(spatial.tools)
##D # sfQuickInit() # from package spatial.tools to launch a parallel PSOCK cluster
##D batch_gdal_translate(infiles=input_folder,outdir=output_folder,
##D 	outsuffix="_converted.envi",of="ENVI",pattern=".tif$")
##D list.files(output_folder,pattern="_converted.envi$")
##D # sfQuickStop() # from package spatial.tools to stop a parallel PSOCK cluster
## End(Not run)



