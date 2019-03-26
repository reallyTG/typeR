library(gdalUtils)


### Name: gdalmanage
### Title: gdalmanage
### Aliases: gdalmanage

### ** Examples

gdal_setInstallation()
valid_install <- !is.null(getOption("gdalUtils_gdalPath"))
if(valid_install)
{
	# Using identify mode
	# Report the data format of the raster file by using the identify mode 
 # and specifying a data file name:
	src_dataset <- system.file("external/tahoe_highrez.tif", package="gdalUtils")
	gdalmanage(mode="identify",datasetname=src_dataset)
	
	# Recursive mode will scan subfolders and report the data format:	
	src_dir <- system.file("external/", package="gdalUtils")
	gdalmanage(mode="identify",datasetname=src_dir,r=TRUE)
	
## Not run: 
##D 		# Using copy mode	
##D 		# Copy the raster data:
##D 		file_copy <- tempfile(fileext=".tif")
##D 		gdalmanage(mode="copy",src_dataset,file_copy)	
##D 		file.exists(file_copy)
##D 		
##D 		# Using rename mode
##D 		# Rename the raster data:
##D 		new_name <- tempfile(fileext=".tif")
##D 		gdalmanage(mode="rename",file_copy,new_name)	
##D 		file.exists(new_name)
##D 		
##D 		# Using delete mode
##D 		# Delete the raster data:
##D 		gdalmanage(mode="delete",new_name)	
##D 		file.exists(new_name)		
## End(Not run)
}



