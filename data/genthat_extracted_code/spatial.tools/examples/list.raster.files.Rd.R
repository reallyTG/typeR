library(spatial.tools)


### Name: list.raster.files
### Title: Spiders a directory for raster files.
### Aliases: list.raster.files

### ** Examples

{ 
search_folder <- system.file("external/", package="spatial.tools")
# sfQuickInit() # To potentially speed the search up.
list.raster.files(path=search_folder)
list.raster.files(path=search_folder,return_rasters=TRUE)
# sfQuickStop() 
}



