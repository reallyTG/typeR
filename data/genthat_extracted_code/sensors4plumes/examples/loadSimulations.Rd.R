library(sensors4plumes)


### Name: loadSimulations
### Title: Load values from raster or text files into Simulations objects
### Aliases: loadSimulations

### ** Examples

## Not run: 
##D # examples for possible input is given in package sensors4plumesData in the 
##D # subfolders of inst/extdata/fileFormats
##D 
##D # from raster files
##D Simulations1 = loadSimulations(
##D   basicPath = paste0(path.package("sensors4plumesData"),
##D                      "/extdata/fileFormats/raster"),
##D   nameSave = "t1_",
##D   overwrite = TRUE
##D )
##D 
##D # from text files
##D Simulations2 = loadSimulations(
##D   basicPath = paste0(path.package("sensors4plumesData"),
##D                      "/extdata/fileFormats/text_multicolumn"),
##D   readBy = "scan",  
##D   nameSave = "t2_",
##D   overwrite = TRUE,
##D   skip = 1
##D )
##D 
##D # from multilayer raster files, selecting locations in a bounding box
##D region = as.logical(replicate(20, sample.int(2,1)) - 1)
##D bBox = c(0.2, 0.7, 0.4, 0.8)
##D 
##D Simulations3 = loadSimulations(
##D   basicPath = paste0(path.package("sensors4plumesData"),
##D                      "/extdata/fileFormats/raster_multilayer"),
##D   nameSave = "t3_",
##D   region = region,
##D   bBox = bBox,
##D   overwrite = TRUE
##D )
## End(Not run)



